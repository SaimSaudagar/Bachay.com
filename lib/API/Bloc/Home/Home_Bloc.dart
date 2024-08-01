import 'package:app/API/Bloc/Home/Home_Event.dart';
import 'package:app/API/Bloc/Home/Home_State.dart';
import 'package:app/API/Repository/Homepage_Repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository homeRepository;

  HomeBloc({required this.homeRepository}) : super(HomeInitial()) {
    on<LoadDiscountBanners>((event, emit) async {
      emit(DiscountBannersLoading());
      try {
        final banners = await homeRepository.fetchDiscountBanner();
        emit(DiscountBannersLoaded(banners));
      } catch (e) {
        emit(DiscountBannersError(e.toString()));
      }
    });

    on<LoadBanners>((event, emit) async {
      emit(BannersLoading());
      try {
        final banners = await homeRepository.fetchBanners();
        emit(BannersLoaded(banners));
      } catch (e) {
        emit(BannersError(e.toString()));
      }
    });

    on<LoadAlterBanners>((event, emit) async {
      emit(AlertBannersLoading());
      try {
        final banners = await homeRepository.fetchAlertPromoBanners();

        emit(AlertBannersLoaded(banners));
      } catch (e) {
        emit(DealBannersError(e.toString()));
      }
    });

    on<LoadDealBanners>((event, emit) async {
      emit(DealBannersLoading());
      try {
        final banners = await homeRepository.fetchDealPromoBanners();

        emit(DealBannersLoaded(banners));
      } catch (e) {
        emit(DealBannersError(e.toString()));
      }
    });

    on<LoadSeasonBanners>((event, emit) async {
      emit(SeasonBannersLoading());
      try {
        final banners = await homeRepository.fetchSeasonBanners();

        emit(SeasonBannersLoaded(banners));
      } catch (e) {
        emit(SeasonBannersError(e.toString()));
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
