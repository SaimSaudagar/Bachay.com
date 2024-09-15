import 'package:app/API/Bloc/Address/Address_Event.dart';
import 'package:app/API/Bloc/Address/Address_State.dart';
import 'package:app/API/Repository/Address_Repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddressBloc extends Bloc<AddressEvent, AddressState> {
  final AddressRepository addressRepository;

  AddressBloc({required this.addressRepository}) : super(AddressInitial()) {
    // on<LoadDiscountBanners>((event, emit) async {
    //   emit(DiscountBannersLoading());
    //   try {
    //     final banners = await addressRepository.fetchDiscountBanner();
    //     emit(DiscountBannersLoaded(banners));
    //   } catch (e) {
    //     emit(DiscountBannersError(e.toString()));
    //   }
    // });
  }
}
