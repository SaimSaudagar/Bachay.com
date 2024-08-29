abstract class OrderEvent {}

class PlaceOrder extends OrderEvent {}

class AllOrder extends OrderEvent {}

class TrackOrder extends OrderEvent {}
// class AddToCart extends CartEvent {
//   final int id;
//   final int quantity;
//   AddToCart({required this.id, required this.quantity});
// }

