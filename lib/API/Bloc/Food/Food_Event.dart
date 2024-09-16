abstract class FoodCategoryEvent {}

class LoadFoodCategories extends FoodCategoryEvent {}
// food_event.dart
abstract class FoodEvent {}

class LoadFoodsByCategory extends FoodEvent {
  final int categoryId;

  LoadFoodsByCategory({required this.categoryId});
}
