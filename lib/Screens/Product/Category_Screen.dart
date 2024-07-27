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
import 'package:app/Utils/app_constants.dart';
import 'package:app/Widgets/App_Bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Widgets/Sidebar.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        state: 1,
      ),
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(getPadding(context)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              categoryBanner(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [mainCategory(), subCategory()],
                ),
              ),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: CustomBottomNavigationBar(
      //   onTabSelected: _onTabSelected,
      // ),
    );
  }

  //Category Banner
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
        // aspectRatio: 1.0,
        viewportFraction: 1,
        height: MediaQuery.of(context).size.height * 0.3,
        // enlargeCenterPage: true,
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

  //Main Category
  Widget mainCategory() {
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
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.3,
      child: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return ListTile(
            // leading: categories[index].icon != null
            //     ? Image.network(
            //         categories[index].icon!,
            //         width: 50,
            //         height: 50,
            //         fit: BoxFit.cover,
            //         errorBuilder: (context, error, stackTrace) {
            //           return Icon(Icons.broken_image);
            //         },
            //       )
            //     : Icon(Icons.category),
            title: Text(
              categories[index].name!,
              style: TextStyle(fontSize: getFontSize(context)),
            ),
            onTap: () {
              // Handle the tap event
            },
          );
        },
      ),
    );
  }

  Widget subCategory() {
    return BlocProvider(
      create: (_) => CategoryBloc(categoryRepository: CategoryRepository())
        ..add(LoadSubCategory()),
      child: BlocBuilder<CategoryBloc, CategoryState>(
        builder: (context, state) {
          if (state is SubCategoryLoading) {
            return const SizedBox();
          } else if (state is SubCategoryLoaded) {
            return buildSubCategory(state.subCategory.categories);
          } else if (state is SubCategoryError) {
            return const SizedBox();
          }
          return const Center(child: Text('Press a button to load categories'));
        },
      ),
    );
  }

  Widget buildSubCategory(List<SubCategory> categories) {
    return Expanded(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.2,
        child: GridView.count(
          crossAxisCount: 3,
          childAspectRatio: 1 / 1.5,
          physics: const NeverScrollableScrollPhysics(),
          children: categories[0]
              .childes!
              .map((category) => buildCategoryTile(category))
              .toList(),
        ),
      ),
    );
  }

  Widget buildCategoryTile(SubCategory category) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Image.network(category.icon, fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
            return const Center(child: Text('Image not available'));
          }),
        ),
        Padding(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
            child: Text(
              category.name,
              style: TextStyle(fontSize: getFontSize(context)),
            )),
      ],
    );
  }
}
