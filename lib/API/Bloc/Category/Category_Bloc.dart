import 'package:app/API/Bloc/Category/Category_Event.dart';
import 'package:app/API/Bloc/Category/Category_State.dart';
import 'package:app/API/Repository/Category_Repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository categoryRepository;

  CategoryBloc({required this.categoryRepository}) : super(CategoryInitial()) {
    on<LoadCategoryBanner>((event, emit) async {
      emit(CategoryBannerLoading());
      try {
        final banners = await categoryRepository.fetchCategoryBanner(1);
        emit(CategoryBannerLoaded(banners));
      } catch (e) {
        print(e.toString());
        emit(CategoryBannerError(e.toString()));
      }
    });

     on<LoadSubCategory>((event, emit) async {
      emit(SubCategoryLoading());
      try {
        final banners = await categoryRepository.fetchSubCategory(1);
        emit(SubCategoryLoaded(banners));
      } catch (e) {
        print(e.toString());
        emit(SubCategoryError(e.toString()));
      }
    });
  }
}
