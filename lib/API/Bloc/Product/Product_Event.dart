// abstract class ProductEvent {}

// class FetchProducts extends ProductEvent {}
// all_products_event.dart
import 'package:equatable/equatable.dart';

abstract class AllProductsEvent extends Equatable {
  const AllProductsEvent();

  @override
  List<Object> get props => [];
}

class LoadAllProducts extends AllProductsEvent {}
