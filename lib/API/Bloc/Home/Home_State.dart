import 'package:app/Models/Home/Alert_Banner.dart';
import 'package:app/Models/Home/Category.dart';
import 'package:app/Models/Home/Deal_Banner.dart';
import 'package:app/Models/Home/Dsicount_Banner.dart';
import 'package:app/Models/Home/Featured_Product.dart';
import 'package:app/Models/Home/Main_Banner.dart';
import 'package:app/Models/Home/Season_Banner.dart';
import 'package:app/Models/Home/Trends.dart';
import 'package:app/Models/Products/Products.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

//Discount Banner
class DiscountBannersLoading extends HomeState {}

class DiscountBannersLoaded extends HomeState {
  final DiscountBannerList discountBanners;
  DiscountBannersLoaded(this.discountBanners);
}

class DiscountBannersError extends HomeState {
  final String message;
  DiscountBannersError(this.message);
}

//Main Banner
class BannersLoading extends HomeState {}

class BannersLoaded extends HomeState {
  final BannerList banners;
  BannersLoaded(this.banners);
}

class BannersError extends HomeState {
  final String message;
  BannersError(this.message);
}

//Alert Banner
class AlertBannersLoading extends HomeState {}

class AlertBannersLoaded extends HomeState {
  final AlertBannerList alertBanners;
  AlertBannersLoaded(this.alertBanners);
}

class AlertBannersError extends HomeState {
  final String message;
  AlertBannersError(this.message);
}

//Deal Banner
class DealBannersLoading extends HomeState {}

class DealBannersLoaded extends HomeState {
  final DealBannerList dealBanners;
  DealBannersLoaded(this.dealBanners);
}

class DealBannersError extends HomeState {
  final String message;
  DealBannersError(this.message);
}

//Season Banner
class SeasonBannersLoading extends HomeState {}

class SeasonBannersLoaded extends HomeState {
  final SeasonBannerList seasonBanners;
  SeasonBannersLoaded(this.seasonBanners);
}

class SeasonBannersError extends HomeState {
  final String message;
  SeasonBannersError(this.message);
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

