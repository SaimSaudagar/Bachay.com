import 'package:app/Models/Home/Category.dart';
import 'package:app/Models/Home/Main_Banner.dart';

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
