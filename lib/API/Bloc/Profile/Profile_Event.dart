abstract class ProfileEvent {}

class LoadProfile extends ProfileEvent {}

// class LoadSingleProduct extends ProfileEvent {
//   final int productId;

//   LoadSingleProduct({required this.productId});
// }

class UpdateProfile extends ProfileEvent {
  final String name;
  final String phone;
  UpdateProfile({required this.name, required this.phone});
}
