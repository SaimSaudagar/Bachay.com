import 'package:app/Models/Cart/CartItem.dart';

abstract class CartState {}

class CartInitial extends CartState {}

//Cart List
class CartListLoading extends CartState {}

class CartListLoaded extends CartState {
  final CartList cartList;
  CartListLoaded(this.cartList);
}

class CartListError extends CartState {
  final String message;
  CartListError(this.message);
}
