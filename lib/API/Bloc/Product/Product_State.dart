import 'package:app/Models/Products/Products.dart';

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
