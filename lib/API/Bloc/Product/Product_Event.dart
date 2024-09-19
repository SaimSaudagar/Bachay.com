abstract class ProductEvent {}

// Product_Event.dart
class LoadAllProducts extends ProductEvent {
  final List<String> colors;
  final List<String> ages;
  final String gender;
  final String? nextPageUrl; 

  LoadAllProducts({
    required this.colors,
    required this.ages,
    required this.gender,
    this.nextPageUrl,
  });
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
