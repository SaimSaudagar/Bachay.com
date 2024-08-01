abstract class CartEvent {}

class LoadCartList extends CartEvent {}

class AddToCart extends CartEvent {
  final int id;
  final int quantity;
  AddToCart({required this.id, required this.quantity});
}

class UpdateCart extends CartEvent {
  final int key;
  final int quantity;

  UpdateCart({required this.key, required this.quantity});
}

class DeleteCartItem extends CartEvent {
  final String key;

  DeleteCartItem({required this.key});
}

class DeleteCart extends CartEvent {}
