import 'package:app/API/Bloc/Food/Food_Event.dart';
import 'package:app/API/Bloc/Food/Food_State.dart';
import 'package:app/API/Repository/Food_Repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FoodBloc extends Bloc<FoodEvent, FoodState> {
  final FoodRepository foodRepository;

  FoodBloc({required this.foodRepository}) : super(FoodInitial()) {
    on<LoadFoodDetail>((event, emit) async {
      emit(FoodDetailsLoading());
      try {
        final foodDetail = await foodRepository.fetchFoodById(1);
        emit(FoodDetailsLoaded(foodDetail));
      } catch (e) {
        print(e.toString());
        emit(FoodDetailsError(e.toString()));
      }
    });
  }
}
