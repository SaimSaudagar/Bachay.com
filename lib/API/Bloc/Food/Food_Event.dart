abstract class FoodEvent {}

class LoadFood extends FoodEvent {
  final int categoryId;

  LoadFood({required this.categoryId});
}

class LoadFoodDetail extends FoodEvent {
  final int foodId;

  LoadFoodDetail({required this.foodId});
}

class AddToCart extends FoodEvent {
  final int foodId;

  AddToCart({required this.foodId});
}
