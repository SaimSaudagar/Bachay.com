import 'package:app/Models/Cart/CartItem.dart';

abstract class CartState {}

class CartInitial extends CartState {}

// //Cart List
// class AddToCartLoading extends CartState {}

// class AddToCartLoaded extends CartState {
//   final String response;
//   AddToCartLoaded(this.response);
// }

// class AddToCartError extends CartState {
//   final String message;
//   AddToCartError(this.message);
// }

//Cart List
class CartListLoading extends CartState {}

class CartListLoaded extends CartState {
  final CartItemList cartList;
  CartListLoaded(this.cartList);
}

class CartListError extends CartState {
  final String message;
  CartListError(this.message);
}

//Update Cart
class UpdateCartLoading extends CartState {}

class UpdateCartLoaded extends CartState {
  final String response;

  UpdateCartLoaded(this.response);
}

class UpdateCartError extends CartState {
  final String message;
  UpdateCartError(this.message);
}

// Delete Cart Item
class DeleteCartItemLoading extends CartState {}

class DeleteCartItemLoaded extends CartState {
  final String response;

  DeleteCartItemLoaded(this.response);
}

class DeleteCartItemError extends CartState {
  final String message;
  DeleteCartItemError(this.message);
}