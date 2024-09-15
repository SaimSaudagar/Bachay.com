abstract class AddressState {}

class AddressInitial extends AddressState {}

class AddressListLoading extends AddressState {}

// class AddressListLoaded extends AddressState {
//   final AddressList addressList;
//   AddressListLoaded(this.addressList);
// }

class AddressListError extends AddressState {
  final String message;
  AddressListError(this.message);
}
