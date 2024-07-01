import 'package:app/Models/Category/Category_Banner.dart';
import 'package:app/Models/Category/Sub_Category.dart';

abstract class CategoryState {}

class CategoryInitial extends CategoryState {}

//Category Banner
class CategoryBannerLoading extends CategoryState {}

class CategoryBannerLoaded extends CategoryState {
  final CategoryBannerList categoryBanner;
  CategoryBannerLoaded(this.categoryBanner);
}

class CategoryBannerError extends CategoryState {
  final String message;
  CategoryBannerError(this.message);
}

//Sub Category
//Category Banner
class SubCategoryLoading extends CategoryState {}

class SubCategoryLoaded extends CategoryState {
  final SubCategoryList subCategory;
  SubCategoryLoaded(this.subCategory);
}

class SubCategoryError extends CategoryState {
  final String message;
  SubCategoryError(this.message);
}
