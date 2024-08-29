import 'package:app/API/Bloc/Category/Category_Bloc.dart';
import 'package:app/API/Bloc/Category/Category_Event.dart';
import 'package:app/API/Bloc/Category/Category_State.dart';
import 'package:app/API/Bloc/Home/Home_Bloc.dart';
import 'package:app/API/Bloc/Home/Home_Event.dart';
import 'package:app/API/Bloc/Home/Home_State.dart';
import 'package:app/API/Repository/Category_Repo.dart';
import 'package:app/API/Repository/Homepage_Repo.dart';
import 'package:app/Models/Category/Category_Banner.dart';
import 'package:app/Models/Category/Sub_Category.dart';
import 'package:app/Models/Home/Category.dart';
import 'package:app/Models/Home/Featured_Product.dart';
import 'package:app/Screens/Product/All_Producst_Screen.dart';
import 'package:app/Screens/Product/Single_Products_Screen.dart';
import 'package:app/Utils/app_constants.dart';
import 'package:app/Widgets/App_Bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../Widgets/Sidebar.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  int? _selectedIndex = 0;
  int? _selectedCategoryId = 1;
  int? selectedCategoryIndex = 0;
  List<SubCategory> subSubCategory = [];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CategoryBloc(categoryRepository: CategoryRepository())
        ..add(LoadSubCategory(categoryId: _selectedCategoryId!)),
      child: Scaffold(
        appBar: const CustomAppBarWithBack(
          state: 1,
        ),
        drawer: const MainDrawer(),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(getPadding(context)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                categorySelection(),
                SizedBox(height: getSpacing(context)),
                categoryBanner(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      subCategory(),
                      buildSubSubCategory(subSubCategory),
                    ],
                  ),
                ),
                featuredProducts(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget categorySelection() {
    return BlocProvider(
      create: (_) =>
          HomeBloc(homeRepository: HomeRepository())..add(LoadCategory()),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is CategoryLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CategoryLoaded) {
            return buildCategorySelection(context, state.category);
          } else if (state is CategoryError) {
            return const SizedBox();
          }
          return const Center(child: Text('Press a button to load categories'));
        },
      ),
    );
  }

  Widget buildCategorySelection(BuildContext context, CategoryList categories) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: categories.categories.map((entry) {
            int index = categories.categories.indexOf(entry);
            String category = entry.name!;

            bool isSelected = selectedCategoryIndex == index;

            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedCategoryIndex = index;
                  _selectedCategoryId = categories.categories[index].id!;
                  subSubCategory =
                      []; // Clear subcategories when a new category is selected
                });

                // Trigger loading of new subcategory based on selected category
                BlocProvider.of<CategoryBloc>(context).add(
                  LoadSubCategory(categoryId: _selectedCategoryId!),
                );
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 4.0),
                padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
                decoration: BoxDecoration(
                  color: isSelected ? Colors.purple[50] : Colors.white,
                  border: Border.all(
                    color: isSelected ? Colors.purple : Colors.grey[300]!,
                    width: isSelected ? 2.0 : 1.0,
                  ),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Text(
                  category,
                  style: TextStyle(
                    color: isSelected ? Colors.purple : Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.0,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  // Category Banner
  Widget categoryBanner() {
    return BlocProvider(
      create: (_) => CategoryBloc(categoryRepository: CategoryRepository())
        ..add(LoadCategoryBanner()),
      child: BlocBuilder<CategoryBloc, CategoryState>(
        builder: (context, state) {
          if (state is CategoryBannerLoading) {
            return const SizedBox();
          } else if (state is CategoryBannerLoaded) {
            return buildCategoryBanner(state.categoryBanner.categoryBanners);
          } else if (state is CategoryBannerError) {
            return const SizedBox();
          }
          return const Center(child: Text('Press a button to load categories'));
        },
      ),
    );
  }

  Widget buildCategoryBanner(List<CategoryBanner> categoryBanner) {
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        viewportFraction: 1,
        height: MediaQuery.of(context).size.height * 0.3,
      ),
      items: categoryBanner.map((banner) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                child: Image.network(
                  banner.mobilePhoto!,
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
            );
          },
        );
      }).toList(),
    );
  }

  Widget subCategory() {
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        if (state is SubCategoryLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is SubCategoryLoaded) {
          subSubCategory = state.subCategory.categories[0].childes!;
          return buildSubCategory(state.subCategory.categories[0].childes!);
        } else if (state is SubCategoryError) {
          return const SizedBox();
        }
        return const Center(child: Text('Select a category'));
      },
    );
  }

  Widget buildSubCategory(List<SubCategory> categories) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.3,
      child: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              categories[index].name,
              style: TextStyle(
                fontSize: getFontSize(context),
                color: _selectedCategoryId == categories[index].id
                    ? Colors.blue
                    : Colors.black,
                fontWeight: _selectedCategoryId == categories[index].id
                    ? FontWeight.bold
                    : FontWeight.normal,
              ),
            ),
            selected: _selectedCategoryId == categories[index].id,
            onTap: () {
              setState(() {
                _selectedIndex = index;
                subSubCategory = categories[index].childes!;
              });
            },
          );
        },
      ),
    );
  }

  Widget buildSubSubCategory(List<SubCategory> categories) {
    return Expanded(
      child: GridView.count(
        crossAxisCount: 3,
        childAspectRatio: 1 / 1.5,
        children:
            categories.map((category) => buildCategoryTile(category)).toList(),
      ),
    );
  }

  Widget buildCategoryTile(SubCategory category) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AllProductsScreen()));
            },
            child: Image.network(category.icon,
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height * 0.08,
                errorBuilder: (context, error, stackTrace) {
              return const Center(child: Text('Image not available'));
            }),
          ),
          Expanded(
            child: Padding(
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
                child: Text(
                  category.name,
                  style: TextStyle(
                    fontSize: getFontSize(context),
                  ),
                  textAlign: TextAlign.center,
                )),
          ),
        ],
      ),
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
            'Categiry Products',
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
}
