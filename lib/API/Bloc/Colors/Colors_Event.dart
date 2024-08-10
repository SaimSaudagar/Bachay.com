import 'package:equatable/equatable.dart';

abstract class ColorEvent extends Equatable {
  const ColorEvent();

  @override
  List<Object> get props => [];
}

class LoadColors extends ColorEvent {}
