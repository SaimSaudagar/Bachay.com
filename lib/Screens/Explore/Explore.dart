import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../Utils/app_constants.dart';
import '../Home/Homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Explore(),
    );
  }
}

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  _ExploreState createState() => _ExploreState();
}

class _ExploreState extends State<Explore> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Padding(
        padding: EdgeInsets.all(getPadding(context)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildProfileHeader(context),
            SizedBox(height: getSpacing(context)),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: const [
                  CarouselWidget(), // Following tab content
                  CarouselWidget(), // Trending tab content
                  CarouselWidget(), // Discover tab content
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.close, color: Colors.black),
        onPressed: () {
           Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
        },
      ),
      title: Center(
        child: Image.asset(
          'assets/logo/LogoExplore.png', // Ensure you have the correct path to the logo image
          height: 40, // Adjust the height as needed
        ),
      ),
      actions: [
        IconButton(
          icon: SvgPicture.asset(
            'assets/images/search-icon.svg',
            width: 24,
            height: 24,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: SvgPicture.asset(
            'assets/images/notification.svg',
            width: 24,
            height: 24,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: Image.asset('assets/images/saved.png', width: 24, height: 24),
          onPressed: () {},
        ),
      ],
      bottom: TabBar(
        controller: _tabController,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.orange.withOpacity(0.1),
        ),
        labelColor: Colors.orange,
        unselectedLabelColor: Colors.grey,
        labelPadding: EdgeInsets.symmetric(horizontal: 16.0),
        tabs: const [
          Tab(child: Text('Following')),
          Tab(child: Text('Trending')),
          Tab(child: Text('Discover')),
        ],
      ),
    );
  }

  Widget _buildProfileHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CircleAvatar(
          backgroundImage: AssetImage('assets/logo/LogoExplore.png'), // Ensure you have the correct path to the avatar image
          radius: 20,
        ),
        SizedBox(width: getSpacing(context)),
        Expanded(
          child: Text(
            'Bachay.com',
            style: outfitBold.copyWith(fontSize: getBigFontSize(context)),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SizedBox(width: getSpacing(context)),
        Icon(Icons.verified, color: Colors.green, size: getFontSize(context)),
        SizedBox(width: getSpacing(context)),
        _buildFollowButton(context),
        SizedBox(width: getSpacing(context)),
        _buildIconWithText(context, Icons.thumb_up_off_alt, '24'),
        SizedBox(width: getSpacing(context)),
        _buildIconWithText(context, Icons.bookmark_border, 'Save'),
        SizedBox(width: getSpacing(context)),
        _buildIconWithText(context, Icons.share, 'Share'),
      ],
    );
  }

  Widget _buildFollowButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.orange,
        backgroundColor: Colors.orange[100],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: const BorderSide(color: Colors.orange),
        ),
      ),
      onPressed: () {},
      child: Text('Follow', style: buttonTextStyle(context)),
    );
  }

  Widget _buildIconWithText(BuildContext context, IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: Colors.black),
        SizedBox(width: getSpacing(context)),
        Text(text, style: const TextStyle(color: Colors.black)),
      ],
    );
  }
}

class CarouselWidget extends StatelessWidget {
  const CarouselWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: MediaQuery.of(context).size.height * 0.25,
        enlargeCenterPage: true,
        autoPlay: true,
        aspectRatio: 16 / 9,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        viewportFraction: 0.8,
      ),
      items: const [
        ProductCard(
          imageUrl: 'https://www.shutterstock.com/image-photo/black-tshirt-clothes-on-isolated-600nw-599532212.jpg',
          title: 'Tween Boy Loose Fit Athletic Solid Color Stand Collar Short Sleeve S...',
          price: 'Rs.850',
          oldPrice: 'Rs.3999',
        ),
        ProductCard(
          imageUrl: 'https://www.shutterstock.com/image-photo/black-tshirt-clothes-on-isolated-600nw-599532212.jpg',
          title: 'Tween Boy Loose Fit Athletic Solid Color Stand Collar Short Sleeve S...',
          price: 'Rs.850',
          oldPrice: 'Rs.3999',
        ),
      ],
    );
  }
}

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String price;
  final String oldPrice;

  const ProductCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.oldPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(getPadding(context)),
        child: Row(
          children: [
            Image.network(
              imageUrl,
              width: MediaQuery.of(context).size.width * 0.25,
              height: MediaQuery.of(context).size.width * 0.25,
              fit: BoxFit.cover,
            ),
            SizedBox(width: getSpacing(context)),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: interBold.copyWith(fontSize: getFontSize(context)),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: getSpacing(context)),
                  Text(
                    price,
                    style: interBold.copyWith(
                        fontSize: getBigFontSize(context), color: Colors.purple),
                  ),
                  SizedBox(height: getSpacing(context)),
                  Text(
                    oldPrice,
                    style: interBold.copyWith(
                        fontSize: getFontSize(context),
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough),
                  ),
                  SizedBox(height: getSpacing(context)),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(borderRadius),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      'Shop Now',
                      style: buttonTextStyle(context),
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.favorite_border),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
