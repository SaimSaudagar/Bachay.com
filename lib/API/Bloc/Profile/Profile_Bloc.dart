import 'package:app/API/Bloc/Profile/Profile_Event.dart';
import 'package:app/API/Bloc/Profile/Profile_State.dart';
import 'package:app/API/Repository/Profile_Repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepository profileRepository;

  ProfileBloc({required this.profileRepository}) : super(ProfileInitial()) {
    on<LoadProfile>((event, emit) async {
      emit(ProfileLoading());
      try {
        final profile = await profileRepository.loadProfile();
        emit(ProfileLoaded(profile));
      } catch (e) {
        emit(ProfileError(e.toString()));
      }
    });

    on<UpdateProfile>((event, emit) async {
      emit(ProfileUpdating());
      try {
        await profileRepository.updateProfile(event.name, event.phone);
        emit(ProfileUpdated());
      } catch (e) {
        emit(ProfileUpdateError(e.toString()));
      }
    });
  }
}
