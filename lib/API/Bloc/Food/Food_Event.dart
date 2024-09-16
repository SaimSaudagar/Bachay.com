import 'package:equatable/equatable.dart';

abstract class FoodCategoryEvent {}

class LoadFoodCategories extends FoodCategoryEvent {}
// food_event.dart
abstract class FoodEvent {}

class LoadFoodsByCategory extends FoodEvent {
  final int categoryId;

  LoadFoodsByCategory({required this.categoryId});
}
abstract class AllFoodEvent extends Equatable {
  const AllFoodEvent();

  @override
  List<Object> get props => [];
}

class LoadAllFoods extends AllFoodEvent {}