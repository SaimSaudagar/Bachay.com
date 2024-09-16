import 'package:app/API/Bloc/Food/Food_Event.dart';
import 'package:app/API/Bloc/Food/Food_State.dart';
import 'package:app/API/Repository/Food_Repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FoodCategoryBloc
    extends Bloc<FoodCategoryEvent, FoodCategoryState> {
  final FoodCategoryRepository repository;

  FoodCategoryBloc(this.repository) : super(FoodCategoryInitial()) {
    on<LoadFoodCategories>((event, emit) async {
      emit(FoodCategoryLoading());
      try {
        final categories = await repository.fetchFoodCategories();
        emit(FoodCategoryLoaded(categories));
      } catch (e) {
        emit(FoodCategoryError(e.toString()));
      }
    });
  }
}
class FoodBloc extends Bloc<FoodEvent, FoodState> {
  final FoodRepository foodRepository;

  FoodBloc({required this.foodRepository}) : super(FoodInitial()) {
    on<LoadFoodsByCategory>((event, emit) async {
      emit(FoodLoading());
      try {
        final foods = await foodRepository.fetchFoodsByCategory(event.categoryId);
        emit(FoodsLoaded(foods: foods));
      } catch (e) {
        emit(FoodError(error: e.toString()));
      }
    });
  }
}
class AllFoodBloc extends Bloc<AllFoodEvent, AllFoodState> {
  final AllFoodRepository allFoodRepository;

  AllFoodBloc({required this.allFoodRepository}) : super(AllFoodInitial()) {
    on<LoadAllFoods>(_onLoadAllFoods);
  }

  Future<void> _onLoadAllFoods(
      LoadAllFoods event, Emitter<AllFoodState> emit) async {
    emit(AllFoodLoading());
    try {
      final foods = await allFoodRepository.fetchAllFoods();
      emit(AllFoodsLoaded(foods));
    } catch (e) {
      emit(AllFoodError(e.toString()));
    }
  }
}