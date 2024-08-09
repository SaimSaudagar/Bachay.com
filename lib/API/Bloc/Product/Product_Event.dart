abstract class ProductEvent {}

class LoadAllProducts extends ProductEvent {
  List<String> colors;
  List<String> ages;

  LoadAllProducts({required this.colors, required this.ages});
}

class LoadSingleProduct extends ProductEvent {
  final int productId;

  LoadSingleProduct({required this.productId});
}

class AddToCart extends ProductEvent {
  final int productId;
  final int quantity;

  AddToCart({required this.productId, required this.quantity});
}
