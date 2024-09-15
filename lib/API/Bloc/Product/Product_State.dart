import 'package:app/Models/Products/Product_Card.dart';
import 'package:app/Models/Products/Products.dart';
import 'package:app/Models/Products/Single_Product.dart';

abstract class ProductState {}

class ProductInitial extends ProductState {}

//All Products
class AllProductsLoading extends ProductState {}

class AllProductsLoaded extends ProductState {
  final AllProduct allProducts;
  AllProductsLoaded(this.allProducts);
}

class AllProductsError extends ProductState {
  final String message;
  AllProductsError(this.message);
}

//Single Product
class SingleProductLoading extends ProductState {}

class SingleProductLoaded extends ProductState {
  final SingleProduct singleProduct;
  SingleProductLoaded(this.singleProduct);
}

class SingleProductError extends ProductState {
  final String message;
  SingleProductError(this.message);
}

//Add to cart
class AddToCartLoading extends ProductState {}

class AddToCartLoaded extends ProductState {
  final String status;
  AddToCartLoaded(this.status);
}

class AddToCartError extends ProductState {
  final String message;
  AddToCartError(this.message);
}

//Recommended Products
class RecommendedProductsLoading extends ProductState {}

class RecommendedProductsLoaded extends ProductState {
  final ListProductCard recommendedProducts;
  RecommendedProductsLoaded(this.recommendedProducts);
}

class RecommendedProductsError extends ProductState {
  final String message;
  RecommendedProductsError(this.message);
}

//Most Popular Products
class MostPopularProductsLoading extends ProductState {}

class MostPopularProductsLoaded extends ProductState {
  final ListProductCard mostPopularProducts;
  MostPopularProductsLoaded(this.mostPopularProducts);
}

class MostPopularProductsError extends ProductState {
  final String message;
  MostPopularProductsError(this.message);
}

//Best Selling Products
class BestSellingProductsLoading extends ProductState {}

class BestSellingProductsLoaded extends ProductState {
  final ListProductCard bestSellingProducts;
  BestSellingProductsLoaded(this.bestSellingProducts);
}

class BestSellingProductsError extends ProductState {
  final String message;
  BestSellingProductsError(this.message);
}

//Top Rated Products
class TopRatedProductsLoading extends ProductState {}

class TopRatedProductsLoaded extends ProductState {
  final ListProductCard topRatedProducts;
  TopRatedProductsLoaded(this.topRatedProducts);
}

class TopRatedProductsError extends ProductState {
  final String message;
  TopRatedProductsError(this.message);
}
