import 'package:app/API/Bloc/Home/Home_State.dart';
import 'package:app/API/Repository/Homepage_Repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_event.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository homeRepository;

  HomeBloc({required this.homeRepository}) : super(HomeInitial()) {
    on<LoadBanners>((event, emit) async {
      emit(BannersLoading());
      try {
        final banners = await homeRepository.fetchBanners();
        emit(BannersLoaded(banners));
      } catch (e) {
        emit(BannersError(e.toString()));
      }
    });

    on<LoadCategory>((event, emit) async {
      emit(CategoryLoading());
      try {
        final categories = await homeRepository.fetchCategories();
        emit(CategoryLoaded(categories));
      } catch (e) {
        emit(CategoryError(e.toString()));
      }
    });

    on<LoadFeaturedProducts>((event, emit) async {
      emit(FeaturedProductLoading());
      try {
        final featuredProducts = await homeRepository.fetchFeaturedProducts();
        emit(FeaturedProductLoaded(featuredProducts));
      } catch (e) {
        emit(FeaturedProductError(e.toString()));
      }
    });

    on<LoadTrendsBanner>((event, emit) async {
      emit(TrendsBannerLoading());
      try {
        final trendsBanner = await homeRepository.fetchTrendsBanner();
        emit(TrendsBannerLoaded(trendsBanner));
      } catch (e) {
        emit(TrendsBannerError(e.toString()));
      }
    });
  }
}
