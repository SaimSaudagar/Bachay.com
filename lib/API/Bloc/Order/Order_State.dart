abstract class OrderState {}

class OrderInitial extends OrderState {}

//Place Order
class PlaceOrderLoading extends OrderState {}

class PlaceOrderLoaded extends OrderState {
  final String response;
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
