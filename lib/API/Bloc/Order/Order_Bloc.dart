import 'package:app/API/Bloc/Order/Order_Event.dart';
import 'package:app/API/Bloc/Order/Order_State.dart';
import 'package:app/API/Repository/Order_Repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final OrderRepository orderRepository;

  OrderBloc({required this.orderRepository}) : super(OrderInitial()) {
    on<PlaceOrder>((event, emit) async {
      emit(PlaceOrderLoading());
      try {
        final response = await orderRepository.placeOrder();
        emit(PlaceOrderLoaded(response));
      } catch (e) {
        emit(PlaceOrderError(e.toString()));
      }
    });

    on<AllOrder>((event, emit) async {
      emit(AllOrderLoading());
      try {
        final response = await orderRepository.fetchAllOrder();
        emit(AllOrderLoaded(response));
      } catch (e) {
        print(e);
        emit(AllOrderError(e.toString()));
      }
    });
  }
}
