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
  final int status;
  AddToCartLoaded(this.status);
}

class AddToCartError extends ProductState {
  final String message;
  AddToCartError(this.message);
}
