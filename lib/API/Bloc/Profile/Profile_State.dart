import 'package:app/Models/Profile/User_Profile.dart';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

// Profile
class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final UserProfile profile;
  ProfileLoaded(this.profile);
}

class ProfileError extends ProfileState {
  final String message;
  ProfileError(this.message);
}
