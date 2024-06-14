
import 'package:app/Models/Home/Main_Banner.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class BannersLoading extends HomeState {}

class BannersLoaded extends HomeState {
  final BannerList banners;
  BannersLoaded(this.banners);
}

class BannersError extends HomeState {
  final String message;
  BannersError(this.message);
}
