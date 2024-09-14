import 'package:app/Models/Food/Food.dart';

abstract class FoodState {}

class FoodInitial extends FoodState {}

//Food Details
class FoodDetailsLoading extends FoodState {}

class FoodDetailsLoaded extends FoodState {
  final FoodDetail foodDetails;
  FoodDetailsLoaded(this.foodDetails);
}

class FoodDetailsError extends FoodState {
  final String message;
  FoodDetailsError(this.message);
}
