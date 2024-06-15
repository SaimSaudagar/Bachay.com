import 'package:app/API/Bloc/Home/Home_Bloc.dart';
import 'package:app/API/Bloc/Home/Home_State.dart';
import 'package:app/API/Bloc/Home/home_event.dart';
import 'package:app/API/Repository/Homepage_Repo.dart';
import 'package:app/Models/Home/Category.dart';
import 'package:app/Widgets/App_Bar.dart';
import 'package:app/Widgets/Botton_Nav_Bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app/Models/Home/Main_Banner.dart';
import 'dart:developer';

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [mainBanner(), buildCategorySection()],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        onTabSelected: _onTabSelected,
      ),
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
        enlargeCenterPage: true,
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
                    return Center(child: Text('Image not available'));
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
      height: 500,
      child: GridView.count(
        crossAxisCount: 3,
        childAspectRatio: 1 / 1.2,
        children:
            categories.map((category) => buildCategoryTile(category)).toList(),
        physics: NeverScrollableScrollPhysics(),
      ),
    );
  }

  Widget buildCategoryTile(Category category) {
    return Card(
      child: Column(
        children: <Widget>[
          Expanded(
            child: Image.network(category.icon!, fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
              return Center(child: Text('Image not available'));
            }),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(category.name!,
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}
