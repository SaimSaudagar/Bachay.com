import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../Utils/app_constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
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
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.black),
          onPressed: () {},
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo/LogoExplore.png', // Ensure you have the correct path to the logo image
              height: 40, // Adjust the height as needed
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.bookmark_border, color: Colors.black),
            onPressed: () {},
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.orange,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey,
          tabs: const [
            Tab(text: 'Following'),
            Tab(text: 'Trending'),
            Tab(text: 'Discover'),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(getPadding(context)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
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
                Icon(
                  Icons.verified,
                  color: Colors.green,
                  size: getFontSize(context),
                ),
                SizedBox(width: getSpacing(context)),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.orange, backgroundColor: Colors.orange[100],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: const BorderSide(color: Colors.orange),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Follow',
                    style: buttonTextStyle(context),
                  ),
                ),
                SizedBox(width: getSpacing(context)),
                Row(
                  children: [
                    const Icon(Icons.thumb_up_off_alt, color: Colors.black),
                    SizedBox(width: getSpacing(context)),
                    const Text('24', style: TextStyle(color: Colors.black)),
                  ],
                ),
                SizedBox(width: getSpacing(context)),
                Row(
                  children: [
                    const Icon(Icons.bookmark_border, color: Colors.black),
                    SizedBox(width: getSpacing(context)),
                    const Text('Save', style: TextStyle(color: Colors.black)),
                  ],
                ),
                SizedBox(width: getSpacing(context)),
                Row(
                  children: [
                    const Icon(Icons.share, color: Colors.black),
                    SizedBox(width: getSpacing(context)),
                    const Text('Share', style: TextStyle(color: Colors.black)),
                  ],
                ),
              ],
            ),
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
          imageUrl: 'https://www.shutterstock.com/image-photo/black-tshirt-clothes-on-isolated-600nw-599532212.jpg', // Replace with your image assets
          title: 'Tween Boy Loose Fit Athletic Solid Color Stand Collar Short Sleeve S...',
          price: 'Rs.850',
          oldPrice: 'Rs.3999',
        ),
        ProductCard(
          imageUrl: 'https://www.shutterstock.com/image-photo/black-tshirt-clothes-on-isolated-600nw-599532212.jpg', // Replace with your image assets
          title: 'Tween Boy Loose Fit Athletic Solid Color Stand Collar Short Sleeve S...',
          price: 'Rs.850',
          oldPrice: 'Rs.3999',
        ),
        // Add more ProductCard widgets as needed
      ],
    );
  }
}

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String price;
  final String oldPrice;

  const ProductCard({super.key, 
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
                    style: interBold.copyWith(fontSize: getBigFontSize(context), color: Colors.purple),
                  ),
                  SizedBox(height: getSpacing(context)),
                  Text(
                    oldPrice,
                    style: interBold.copyWith(fontSize: getFontSize(context), color: Colors.grey, decoration: TextDecoration.lineThrough),
                  ),
                  SizedBox(height: getSpacing(context)),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, backgroundColor: Colors.orange,
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
