import 'package:app/API/Bloc/Home/Home_Bloc.dart';
import 'package:app/API/Bloc/Home/Home_State.dart';
import 'package:app/API/Bloc/Home/home_event.dart';
import 'package:app/API/Repository/Homepage_Repo.dart';
import 'package:app/Models/Home/Category.dart';
import 'package:app/Models/Home/Featured_Product.dart';
import 'package:app/Models/Home/Trends.dart';
import 'package:app/Utils/app_constants.dart';
import 'package:app/Widgets/App_Bar.dart';
import 'package:app/Widgets/Botton_Nav_Bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app/Models/Home/Main_Banner.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onTabSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(getPadding(context)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              mainBanner(),
              spacing(context),
              buildCategorySection(),
              spacing(context),
              freeDelivery(),
              spacing(context),
              featuredProducts(),
              spacing(context),
              parentingTools(context),
              spacing(context),
              trendsBanner(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        onTabSelected: _onTabSelected,
      ),
    );
  }

  Widget spacing(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.01,
    );
  }

  Widget spacingHorizontal(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.height * 0.01,
    );
  }

  //Main Banner
  Widget mainBanner() {
    return BlocProvider(
      create: (_) =>
          HomeBloc(homeRepository: HomeRepository())..add(LoadBanners()),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is BannersLoading) {
            return SizedBox();
          } else if (state is BannersLoaded) {
            return _buildCarousel(state.banners);
          } else if (state is BannersError) {
            return SizedBox();
          }
          return Center(child: Text('Press a button to load banners'));
        },
      ),
    );
  }

  Widget _buildCarousel(BannerList banners) {
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        aspectRatio: 2.0,
        // enlargeCenterPage: true,
      ),
      items: banners.mainBanner.map((banner) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Image.network(
                  banner.photo,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Center(
                        child: Text(
                      'Image not available',
                      style: TextStyle(fontSize: getFontSize(context)),
                    ));
                  },
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }

  //Category
  Widget buildCategorySection() {
    return BlocProvider(
      create: (_) =>
          HomeBloc(homeRepository: HomeRepository())..add(LoadCategory()),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is CategoryLoading) {
            return SizedBox();
          } else if (state is CategoryLoaded) {
            return buildCategory(state.category.categories);
          } else if (state is CategoryError) {
            return SizedBox();
          }
          return Center(child: Text('Press a button to load categories'));
        },
      ),
    );
  }

  Widget buildCategory(List<Category> categories) {
    return Container(
      height: 300,
      child: GridView.count(
        crossAxisCount: 5,
        childAspectRatio: 1 / 1.5,
        children:
            categories.map((category) => buildCategoryTile(category)).toList(),
        physics: NeverScrollableScrollPhysics(),
      ),
    );
  }

  Widget buildCategoryTile(Category category) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Image.network(category.icon!, fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
            return Center(child: Text('Image not available'));
          }),
        ),
        Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
          child: Text(category.name!,
              style: TextStyle(fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }

//Free Delivery
  Widget freeDelivery() {
    Color textColor = Color.fromRGBO(111, 65, 11, 1);
    Color color = Color.fromRGBO(254, 233, 209, 1);
    Color borderColor = Color.fromRGBO(252, 212, 164, 1);
    double fontSize = MediaQuery.of(context).size.width * 0.025;
    double fontSizeBig = MediaQuery.of(context).size.width * 0.025;
    return Row(
      children: [
        Expanded(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.08,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: borderColor,
                width: 2,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.local_shipping,
                  size: MediaQuery.of(context).size.width * 0.1,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Free Delivery',
                      style: TextStyle(
                        color: textColor,
                        fontSize: fontSizeBig,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'On orders above \Rs. 500',
                      style: TextStyle(
                        color: textColor,
                        fontSize: fontSize,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.05,
        ),
        Expanded(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.08,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: borderColor,
                width: 2,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.keyboard_return,
                  size: MediaQuery.of(context).size.width * 0.1,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Return Policy',
                      style: TextStyle(
                        color: textColor,
                        fontSize: fontSizeBig,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Return within 15 days',
                      style: TextStyle(
                        color: textColor,
                        fontSize: fontSize,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

// Featured Products
  Widget featuredProducts() {
    return BlocProvider(
      create: (_) => HomeBloc(homeRepository: HomeRepository())
        ..add(LoadFeaturedProducts()),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is FeaturedProductLoading) {
            return SizedBox();
          } else if (state is FeaturedProductLoaded) {
            return buildFeaturedProducts(
                context, state.featuredProduct.products);
          } else if (state is FeaturedProductError) {
            return Text('Failed to load products');
          }
          return Center(child: Text('Press a button to load categories'));
        },
      ),
    );
  }

  Widget buildFeaturedProducts(
      BuildContext context, List<FeaturedProduct> products) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
          child: Text(
            'Featured Products',
            style: TextStyle(
              fontSize: 20, // Example font size, adjust as needed
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: products.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.75,
          ),
          itemBuilder: (context, index) {
            return buildFeaturedProductTile(context, products[index]);
          },
        ),
      ],
    );
  }

  Widget buildFeaturedProductTile(
      BuildContext context, FeaturedProduct product) {
    Color textColor = Color.fromRGBO(191, 143, 57, 1);
    Color color = Color.fromRGBO(255, 244, 223, 1);
    Color borderColor = Color.fromRGBO(255, 198, 95, 1);
    double fontSize = MediaQuery.of(context).size.width * 0.025;
    double fontSizeBig = MediaQuery.of(context).size.width * 0.025;

    return Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.01),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Color.fromRGBO(228, 228, 231, 1),
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(10)),
                    image: DecorationImage(
                      image: NetworkImage(product.thumbnail),
                      fit: BoxFit.cover,
                      onError: (error, stackTrace) =>
                          Center(child: Text('Image not available')),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
              child: Text(
                product.name,
                style: TextStyle(fontSize: fontSize),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(children: [
                RatingBarIndicator(
                  rating: 4.5,
                  itemBuilder: (context, index) =>
                      Icon(Icons.star, color: Colors.amber),
                  itemCount: 1,
                  itemSize: 20.0,
                  direction: Axis.horizontal,
                ),
                Text(
                  '4.5',
                  style: TextStyle(
                      fontSize: fontSize, fontWeight: FontWeight.bold),
                ),
                Text(
                  ' (100)',
                  style: TextStyle(fontSize: fontSize),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    color: color,
                    border: Border.all(
                      color: borderColor,
                      width: 1,
                    ),
                  ),
                  child: Text(
                    'Free Delivery',
                    style: TextStyle(
                      color: textColor,
                      fontSize: fontSize,
                    ),
                  ),
                )
              ]),
            ),
            Padding(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\Rs.${product.variations[0].price.toStringAsFixed(2)}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  //Parenting Tools
  Widget parentingTools(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/images/parenting_tool.png',
          fit: BoxFit.cover,
        ),
        spacing(context),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset("assets/images/article.png"),
            Image.asset("assets/images/QnA.png"),
            Image.asset("assets/images/vaccination.png"),
          ],
        )
      ],
    );
  }

  //Trends Banner
  Widget trendsBanner() {
    return BlocProvider(
      create: (_) =>
          HomeBloc(homeRepository: HomeRepository())..add(LoadTrendsBanner()),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is TrendsBannerLoading) {
            return SizedBox();
          } else if (state is TrendsBannerLoaded) {
            return buildTrendsBanner(state.trendsBanner);
          } else if (state is TrendsBannerError) {
            return SizedBox();
          }
          return Center(child: Text('Press a button to load trends banner'));
        },
      ),
    );
  }

  Widget buildTrendsBanner(TrendsBannerList trendsBanner) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      final double itemWidth = MediaQuery.of(context).size.width *
          0.45; // Adjusted width for each item
      final double itemHeight = MediaQuery.of(context).size.height *
          0.15; // Adjusted height for each item
      List<TrendsBanner> reverseList = trendsBanner.banners.reversed.toList();

      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Column for images 1 and 2
              Column(
                children: [
                  Container(
                    width: itemWidth / 1.25,
                    height: itemHeight * 1.5,
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.circular(10), // Rounded corners
                      child: Image.network(
                        reverseList[0].photo,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  spacing(context),
                  Container(
                    width: itemWidth / 1.25,
                    height: itemHeight / 1.5,
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.circular(10), // Rounded corners
                      child: Image.network(
                        reverseList[1].photo,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ],
              ),
              spacingHorizontal(context),
              // Image 3, spans two rows
              Container(
                width: itemWidth * 1.2,
                height: itemHeight * 2.2 +
                    MediaQuery.of(context).size.height *
                        0.01, // Adjusted for two rows
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10), // Rounded corners
                  child: Image.network(
                    reverseList[2].photo,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          ),
          spacing(context),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image 4, spans two rows
              Container(
                width: itemWidth,
                height: itemHeight * 1.5 +
                    MediaQuery.of(context).size.height *
                        0.01, // Adjusted for two rows
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10), // Rounded corners
                  child: Image.network(
                    reverseList[3].photo,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              spacingHorizontal(context),
              // Column for images 5 and 6
              Column(
                children: [
                  Container(
                    width: itemWidth,
                    height: itemHeight / 2,
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.circular(10), // Rounded corners
                      child: Image.network(
                        reverseList[4].photo,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  spacing(context),
                  Container(
                    width: itemWidth,
                    height: itemHeight,
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.circular(10), // Rounded corners
                      child: Image.network(
                        reverseList[5].photo,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      );
    });
  }
}
