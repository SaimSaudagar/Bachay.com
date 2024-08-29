import 'package:app/API/Bloc/Child/Child_Event.dart';
import 'package:app/API/Bloc/Child/Child_State.dart';
import 'package:app/API/Repository/Child_Repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChildBloc extends Bloc<ChildEvent, ChildState> {
  final ChildRepository childRepository;

  ChildBloc({required this.childRepository}) : super(ChildInitial()) {
    on<LoadChildren>((event, emit) async {
      emit(ChildLoading());
      try {
        final children = await childRepository.fetchChildren();
        print(children);
        emit(ChildLoaded(children));
      } catch (e) {
        print(e);
        emit(ChildError(e.toString()));
      }
    });
  }
}
