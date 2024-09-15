import 'package:app/API/Bloc/Address/Address_Event.dart';
import 'package:app/API/Bloc/Address/Address_State.dart';
import 'package:app/API/Repository/Address_Repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddressBloc extends Bloc<AddressEvent, AddressState> {
  final AddressRepository addressRepository;

  AddressBloc({required this.addressRepository}) : super(AddressInitial()) {
    on<LoadAddressList>((event, emit) async {
      emit(AddressListLoading());
      try {
        final banners = await addressRepository.fetchAllAddresses();
        emit(AddressListLoaded(banners));
      } catch (e) {
        emit(AddressListError(e.toString()));
      }
    });
  }
}
