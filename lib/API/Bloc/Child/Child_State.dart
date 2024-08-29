import 'package:app/Models/Child/Child.dart';

abstract class ChildState {}

class ChildInitial extends ChildState {}

//Load Children
class ChildLoading extends ChildState {}

class ChildLoaded extends ChildState {
  final ChildrenList child;
  ChildLoaded(this.child);
}

class ChildError extends ChildState {
  final String message;
  ChildError(this.message);
}
