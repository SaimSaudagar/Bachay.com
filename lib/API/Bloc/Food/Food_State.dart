import 'package:app/API/Bloc/Food/Food_Bloc.dart';

import '../../../Models/Food/Food.dart';


abstract class FoodCategoryState {}

class FoodCategoryInitial extends FoodCategoryState {}

class FoodCategoryLoading extends FoodCategoryState {}

class FoodCategoryLoaded extends FoodCategoryState {
  final List<FoodCategory> categories;

  FoodCategoryLoaded(this.categories);
}

class FoodCategoryError extends FoodCategoryState {
  final String message;

  FoodCategoryError(this.message);
}
// food_state.dart
abstract class FoodState {}

class FoodInitial extends FoodState {}

class FoodLoading extends FoodState {}

class FoodsLoaded extends FoodState {
  final List<Food> foods;

  FoodsLoaded({required this.foods});
}

class FoodError extends FoodState {
  final String error;

  FoodError({required this.error});
}
