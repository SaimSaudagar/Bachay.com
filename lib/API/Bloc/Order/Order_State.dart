import 'package:app/Models/Order/Order_List.dart';

abstract class OrderState {}

class OrderInitial extends OrderState {}

//Place Order
class PlaceOrderLoading extends OrderState {}

class PlaceOrderLoaded extends OrderState {
  final int response;
  PlaceOrderLoaded(this.response);
}

class PlaceOrderError extends OrderState {
  final String message;
  PlaceOrderError(this.message);
}

// Track Order
class TrackOrderLoading extends OrderState {}

class TrackOrderLoaded extends OrderState {
  final String response;
  TrackOrderLoaded(this.response);
}

class TrackOrderError extends OrderState {
  final String message;
  TrackOrderError(this.message);
}

// All Order
class AllOrderLoading extends OrderState {}

class AllOrderLoaded extends OrderState {
  final OrderList orderList;
  AllOrderLoaded(this.orderList);
}

class AllOrderError extends OrderState {
  final String message;
  AllOrderError(this.message);
}
