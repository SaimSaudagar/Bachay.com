import 'package:app/API/Bloc/Home/Home_Bloc.dart';
import 'package:app/API/Bloc/Home/Home_Event.dart';
import 'package:app/API/Bloc/Home/Home_State.dart';
import 'package:app/API/Bloc/Product/Product_Bloc.dart';
import 'package:app/API/Bloc/Product/Product_Event.dart';
import 'package:app/API/Bloc/Product/Product_State.dart';
import 'package:app/API/Repository/Homepage_Repo.dart';
import 'package:app/API/Repository/Product_Repository.dart';
import 'package:app/Models/Home/Alert_Banner.dart';
import 'package:app/Models/Home/Category.dart';
import 'package:app/Models/Home/Deal_Banner.dart';
import 'package:app/Models/Home/Dsicount_Banner.dart';
import 'package:app/Models/Home/Featured_Product.dart';
import 'package:app/Models/Home/Season_Banner.dart';
import 'package:app/Models/Home/Trends.dart';
import 'package:app/Models/Products/Products.dart';
import 'package:app/Screens/Product/Category_Screen.dart';
import 'package:app/Screens/Product/Single_Products_Screen.dart';
import 'package:app/Utils/app_constants.dart';
import 'package:app/Widgets/App_Bar.dart';
import 'package:app/Widgets/Botton_Nav_Bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app/Models/Home/Main_Banner.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../Widgets/Sidebar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

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
      appBar: const CustomAppBar(
        state: 3,
      ),
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(getPadding(context)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              discountBanner(),
              spacing(context),
              mainBanner(),
              spacing(context),
              alertBanner(),
              spacing(context),
              buildCategorySection(),
              spacing(context),
              freeDelivery(),
              spacing(context),
              dealBanner(),
              spacing(context),
              seasonBanner(),
              spacing(context),
              featuredProducts(),
              spacing(context),
              parentingTools(context),
              spacing(context),
              trendsBanner(),
              spacing(context),
              allProducts(),
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

//Discount Banner
  Widget discountBanner() {
    return BlocProvider(
      create: (_) => HomeBloc(homeRepository: HomeRepository())
        ..add(LoadDiscountBanners()),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is DiscountBannersLoading) {
            return const SizedBox();
          } else if (state is DiscountBannersLoaded) {
            return buildDiscountBanner(state.discountBanners);
          } else if (state is DiscountBannersError) {
            return const SizedBox();
          }
          return const Center(
              child: Text('Press a button to load discount banner'));
        },
      ),
    );
  }

  Widget buildDiscountBanner(DiscountBannerList discountBanners) {
    return CarouselSlider(
      options: CarouselOptions(
        // aspectRatio: 1.0,
        viewportFraction: 0.2,

        height: MediaQuery.of(context).size.height * 0.1,
      ),
      items: discountBanners.discountBanner.map((banner) {
        return Builder(
          builder: (BuildContext context) {
            return ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(20.0)),
              child: Image.network(
                banner.image!,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Center(
                      child: Text(
                    'Image not available',
                    style: TextStyle(fontSize: getFontSize(context)),
                  ));
                },
              ),
            );
          },
        );
      }).toList(),
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
            return const SizedBox();
          } else if (state is BannersLoaded) {
            return _buildCarousel(state.banners);
          } else if (state is BannersError) {
            return const SizedBox();
          }
          return const Center(child: Text('Press a button to load banners'));
        },
      ),
    );
  }

  Widget _buildCarousel(BannerList banners) {
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        aspectRatio: 1.0,
        viewportFraction: 1,
        height: MediaQuery.of(context).size.height * 0.2,
        // enlargeCenterPage: true,
      ),
      items: banners.mainBanner.map((banner) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(5.0)),
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

//Alert Banner
  Widget alertBanner() {
    return BlocProvider(
      create: (_) =>
          HomeBloc(homeRepository: HomeRepository())..add(LoadAlterBanners()),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is AlertBannersLoading) {
            return const SizedBox();
          } else if (state is AlertBannersLoaded) {
            return buildAlertBanner(state.alertBanners);
          } else if (state is AlertBannersError) {
            return const SizedBox();
          }
          return const Center(
              child: Text('Press a button to load alert banners'));
        },
      ),
    );
  }

  Widget buildAlertBanner(AlertBannerList alertBanners) {
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        // aspectRatio: 1.0,
        viewportFraction: 1,
        height: MediaQuery.of(context).size.height * 0.1,
        // enlargeCenterPage: true,
      ),
      items: alertBanners.alertBanner.map((banner) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                child: Image.network(
                  banner.mobilePhoto!,
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

//Deal Banner
  Widget dealBanner() {
    return BlocProvider(
      create: (_) =>
          HomeBloc(homeRepository: HomeRepository())..add(LoadDealBanners()),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is DealBannersLoading) {
            return const SizedBox();
          } else if (state is DealBannersLoaded) {
            return buildDealBanner(state.dealBanners);
          } else if (state is DealBannersError) {
            return const SizedBox();
          }
          return const Center(
              child: Text('Press a button to load deal banners'));
        },
      ),
    );
  }

  Widget buildDealBanner(DealBannerList dealBanners) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final double itemWidth = MediaQuery.of(context).size.width * 0.45;
        final double itemHeight = MediaQuery.of(context).size.height * 0.13;
        List<DealBanner> reverseList = dealBanners.dealBanner.reversed.toList();

        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Image 3, spans two rows
                SizedBox(
                  width: itemWidth,
                  height: itemHeight * 2 +
                      MediaQuery.of(context).size.height * 0.01,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      reverseList[0].mobilePhoto!,
                      fit: BoxFit.fill,
                      errorBuilder: (context, error, stackTrace) {
                        return Center(
                            child: Text(
                          'Image not available',
                          style: TextStyle(fontSize: getFontSize(context)),
                        ));
                      },
                    ),
                  ),
                ),
                spacingHorizontal(context),
                // Column for images 1 and 2
                Column(
                  children: [
                    SizedBox(
                      width: itemWidth,
                      height: itemHeight * 1.4,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          reverseList[1].mobilePhoto!,
                          fit: BoxFit.fill,
                          errorBuilder: (context, error, stackTrace) {
                            return Center(
                                child: Text(
                              'Image not available',
                              style: TextStyle(fontSize: getFontSize(context)),
                            ));
                          },
                        ),
                      ),
                    ),
                    spacing(context),
                    SizedBox(
                      width: itemWidth,
                      height: itemHeight / 1.6,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          reverseList[2].mobilePhoto!,
                          fit: BoxFit.fill,
                          errorBuilder: (context, error, stackTrace) {
                            return Center(
                                child: Text(
                              'Image not available',
                              style: TextStyle(fontSize: getFontSize(context)),
                            ));
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            spacing(context),
          ],
        );
      },
    );
  }

//Season Banner
  Widget seasonBanner() {
    return BlocProvider(
      create: (_) =>
          HomeBloc(homeRepository: HomeRepository())..add(LoadSeasonBanners()),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is SeasonBannersLoading) {
            return const SizedBox();
          } else if (state is SeasonBannersLoaded) {
            return buildSeasonBanner(state.seasonBanners);
          } else if (state is SeasonBannersError) {
            return const SizedBox();
          }
          return const Center(
              child: Text('Press a button to load season banner'));
        },
      ),
    );
  }

  Widget buildSeasonBanner(SeasonBannerList seasonBanner) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.2,
      child: Image.network(seasonBanner.seasonBanner[0].photo!),
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
            return const SizedBox();
          } else if (state is CategoryLoaded) {
            return buildCategory(state.category.categories);
          } else if (state is CategoryError) {
            return const SizedBox();
          }
          return const Center(child: Text('Press a button to load categories'));
        },
      ),
    );
  }

  Widget buildCategory(List<Category> categories) {
    final List<Category> doubledCategories = [
      ...categories,
      ...categories,
      ...categories
    ];

    return GestureDetector(
      onTap: () => {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const CategoryScreen()),
        ),
      },
      child: Column(
        children: [
          SizedBox(
            height: 350,
            child: GridView.count(
              crossAxisCount: 5,
              childAspectRatio: 1 / 1.5,
              physics: const NeverScrollableScrollPhysics(),
              children: doubledCategories
                  .map((category) => buildCategoryTile(category))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCategoryTile(Category category) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Image.network(category.icon!, fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
            return const Center(child: Text('Image not available'));
          }),
        ),
        Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
          child: Text(category.name!,
              style: const TextStyle(fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }

  //Free Delivery
  Widget freeDelivery() {
    Color textColor = const Color.fromRGBO(111, 65, 11, 1);
    Color color = const Color.fromRGBO(254, 233, 209, 1);
    Color borderColor = const Color.fromRGBO(252, 212, 164, 1);
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
                Image.asset(
                  'assets/images/truck.png',
                  width: MediaQuery.of(context).size.width * 0.1,
                  height: MediaQuery.of(context).size.width * 0.1,
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
                      'On orders above Rs. 500',
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
                Image.asset(
                  'assets/images/return.png',
                  width: MediaQuery.of(context).size.width * 0.1,
                  height: MediaQuery.of(context).size.width * 0.1,
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
            return const SizedBox();
          } else if (state is FeaturedProductLoaded) {
            return buildFeaturedProducts(
                context, state.featuredProduct.products);
          } else if (state is FeaturedProductError) {
            return Container();
          }
          return const Center(
              child: Text('Press a button to load featuted products'));
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
          child: const Text(
            'Featured Products',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: products.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.75,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
                onTap: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SingleProductScreen(
                                  productId: products[index].id,
                                )),
                      ),
                    },
                child: buildFeaturedProductTile(context, products[index]));
          },
        ),
      ],
    );
  }

  Widget buildFeaturedProductTile(
      BuildContext context, FeaturedProduct product) {
    Color textColor = const Color.fromRGBO(191, 143, 57, 1);
    Color color = const Color.fromRGBO(255, 244, 223, 1);
    Color borderColor = const Color.fromRGBO(255, 198, 95, 1);
    double fontSize = MediaQuery.of(context).size.width * 0.025;

    return Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.01),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: const Color.fromRGBO(228, 228, 231, 1),
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
                        const BorderRadius.vertical(top: Radius.circular(10)),
                    image: DecorationImage(
                      image: NetworkImage(product.thumbnail),
                      fit: BoxFit.cover,
                      onError: (error, stackTrace) =>
                          const Center(child: Text('Image not available')),
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
                      const Icon(Icons.star, color: Colors.amber),
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
                  margin: const EdgeInsets.only(left: 10),
                  padding: const EdgeInsets.symmetric(horizontal: 5),
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
                    "Rs.${product.variations[0].price.toStringAsFixed(2)}",
                    style: const TextStyle(
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
        ),
        spacing(context),
        CarouselSlider(
          options: CarouselOptions(
            // autoPlay: true,
            // enlargeCenterPage: true,
            aspectRatio: 2.0,
            viewportFraction: 0.38,
          ),
          items: [
            'assets/images/article.png',
            'assets/images/QnA.png',
            'assets/images/vaccination.png',
          ].map((item) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                    child: Image.asset(
                      item,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
        spacing(context),
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
            return const SizedBox();
          } else if (state is TrendsBannerLoaded) {
            return buildTrendsBanner(state.trendsBanner);
          } else if (state is TrendsBannerError) {
            return const SizedBox();
          }
          return const Center(
              child: Text('Press a button to load trends banner'));
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
                  SizedBox(
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
                  SizedBox(
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
              SizedBox(
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
              SizedBox(
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
                  SizedBox(
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
                  SizedBox(
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

  //All Products
  Widget allProducts() {
    return BlocProvider(
      create: (_) => ProductBloc(productRepository: ProductRepository())
        ..add(LoadAllProducts(colors: [], ages: [])),
      child: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is AllProductsLoading) {
            return const SizedBox();
          } else if (state is AllProductsLoaded) {
            return buildAllProducts(
                context, state.allProducts.allProducts!.data);
          } else if (state is AllProductsError) {
            return const Text('Failed to load all products');
          }
          return const Center(child: Text('Press a button to load categories'));
        },
      ),
    );
  }

  Widget buildAllProducts(BuildContext context, List<Product> products) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
          child: const Text(
            'All Products',
            style: TextStyle(
              fontSize: 20, // Example font size, adjust as needed
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: products.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.75,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
                onTap: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SingleProductScreen(
                                  productId: products[index].id,
                                )),
                      ),
                    },
                child: buildAllProductTile(context, products[index]));
          },
        ),
      ],
    );
  }

  Widget buildAllProductTile(BuildContext context, Product product) {
    Color textColor = const Color.fromRGBO(191, 143, 57, 1);
    Color color = const Color.fromRGBO(255, 244, 223, 1);
    Color borderColor = const Color.fromRGBO(255, 198, 95, 1);
    double fontSize = MediaQuery.of(context).size.width * 0.025;

    return Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.01),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: const Color.fromRGBO(228, 228, 231, 1),
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
                        const BorderRadius.vertical(top: Radius.circular(10)),
                    image: DecorationImage(
                      image: NetworkImage(product.thumbnail),
                      fit: BoxFit.cover,
                      onError: (error, stackTrace) =>
                          const Center(child: Text('Image not available')),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
              child: Text(
                product.name.toString(),
                style: TextStyle(fontSize: fontSize),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(children: [
                RatingBarIndicator(
                  rating: 1,
                  itemBuilder: (context, index) =>
                      const Icon(Icons.star, color: Colors.amber),
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
                  margin: const EdgeInsets.only(left: 10),
                  padding: const EdgeInsets.symmetric(horizontal: 5),
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
                    "Rs.${product.unitPrice.toStringAsFixed(2)}",
                    style: const TextStyle(
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
}
