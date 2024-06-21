// import '../../../Models/Products/Products.dart';

// abstract class ProductState {}

// class ProductInitial extends ProductState {}

// class ProductLoading extends ProductState {}

// class ProductLoaded extends ProductState {
//   final ProductResponse productResponse;

//   ProductLoaded(this.productResponse);
// }

// class ProductError extends ProductState {
//   final String message;

//   ProductError(this.message);
// }
// all_products_state.dart
import 'package:equatable/equatable.dart';
import 'package:app/Models/Home/Featured_Product.dart';

abstract class AllProductsState extends Equatable {
  const AllProductsState();

  @override
  List<Object> get props => [];
}

class AllProductsInitial extends AllProductsState {}

class AllProductsLoading extends AllProductsState {}

class AllProductsLoaded extends AllProductsState {
  final List<FeaturedProduct> products;

  const AllProductsLoaded(this.products);

  @override
  List<Object> get props => [products];
}

class AllProductsError extends AllProductsState {}
