abstract class ProductEvent {}

class LoadAllProducts extends ProductEvent {
  List<String> colors;
  List<String> ages;
  final String? gender;

  LoadAllProducts(
      {required this.colors, required this.ages, required this.gender});
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

class LoadRcommendedProducts extends ProductEvent {
  final int productId;

  LoadRcommendedProducts({required this.productId});
}

class LoadMostPopularProducts extends ProductEvent {}

class LoadBestSellingProducts extends ProductEvent {}

class LoadTopRatedProducts extends ProductEvent {}
