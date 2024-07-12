abstract class ProductEvent {}

class LoadAllProducts extends ProductEvent {}

class LoadSingleProduct extends ProductEvent {
  final int productId;

  LoadSingleProduct({required this.productId});
}
