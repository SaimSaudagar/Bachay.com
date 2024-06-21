import 'package:app/Models/Home/Category.dart';
import 'package:app/Models/Home/Featured_Product.dart';
import 'package:app/Models/Home/Main_Banner.dart';
import 'package:app/Models/Home/Trends.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

//Banner
class BannersLoading extends HomeState {}

class BannersLoaded extends HomeState {
  final BannerList banners;
  BannersLoaded(this.banners);
}

class BannersError extends HomeState {
  final String message;
  BannersError(this.message);
}

//Category
class CategoryLoading extends HomeState {}

class CategoryLoaded extends HomeState {
  final CategoryList category;
  CategoryLoaded(this.category);
}

class CategoryError extends HomeState {
  final String message;
  CategoryError(this.message);
}

//Featured Products
class FeaturedProductLoading extends HomeState {}

class FeaturedProductLoaded extends HomeState {
  final FeaturedProductList featuredProduct;
  FeaturedProductLoaded(this.featuredProduct);
}

class FeaturedProductError extends HomeState {
  final String message;
  FeaturedProductError(this.message);
}



//Trends Banner
class TrendsBannerLoading extends HomeState {}

class TrendsBannerLoaded extends HomeState {
  final TrendsBannerList trendsBanner;
  TrendsBannerLoaded(this.trendsBanner);
}

class TrendsBannerError extends HomeState {
  final String message;
  TrendsBannerError(this.message);
}
