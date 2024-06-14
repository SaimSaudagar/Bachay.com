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
  }
}
