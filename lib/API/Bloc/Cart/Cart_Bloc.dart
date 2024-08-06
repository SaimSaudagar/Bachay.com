import 'package:app/API/Bloc/Cart/Cart_Event.dart';
import 'package:app/API/Bloc/Cart/Cart_State.dart';
import 'package:app/API/Repository/Cart_Repo.dart';
import 'package:app/Models/Cart/CartItem.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartRepository cartRepository;
  final _debounce = PublishSubject<UpdateCart>();

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

    on<UpdateCart>((event, emit) => _debounce.add(event),
        transformer: debounceTransformer(Duration(seconds: 1)));

    _debounce.stream.listen((event) async {
      emit(UpdateCartLoading());
      try {
        final response =
            await cartRepository.updateCart(event.key, event.quantity);

        add(LoadCartList());
        emit(UpdateCartLoaded("Cart Updated"));
      } catch (e) {
        emit(UpdateCartError(e.toString()));
      }
    });

    on<DeleteCartItem>((event, emit) async {
      emit(DeleteCartItemLoading());
      try {
        final response = await cartRepository.deleteCartItem(event.key);
        add(LoadCartList());
        emit(DeleteCartItemLoaded(response));
      } catch (e) {
        emit(CartListError(e.toString()));
      }
    });
    on<DeleteCart>((event, emit) async {
      emit(CartListLoading());
      try {
        await cartRepository.deleteCart();
        emit(CartListLoaded([] as CartItemList));
      } catch (e) {
        emit(CartListError(e.toString()));
      }
    });
  }

  @override
  Future<void> close() {
    _debounce.close();
    return super.close();
  }

  EventTransformer<T> debounceTransformer<T>(Duration duration) {
    return (events, mapper) {
      return events.debounceTime(duration).switchMap(mapper);
    };
  }
}
