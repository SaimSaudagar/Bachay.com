import 'package:app/API/Bloc/Cart/Cart_Event.dart';
import 'package:app/API/Bloc/Cart/Cart_State.dart';
import 'package:app/API/Bloc/Category/Category_Event.dart';
import 'package:app/API/Bloc/Category/Category_State.dart';
import 'package:app/API/Repository/Cart_Repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartRepository cartRepository;

  CartBloc({required this.cartRepository}) : super(CartInitial()) {
    on<LoadCartList>((event, emit) async {
      emit(CartListLoading());
      try {
        final cartList = await cartRepository.fetchCartList();
        emit(CartListLoaded(cartList));
      } catch (e) {
        emit(CartListError(e.toString()));
      }
    });
  }
}
