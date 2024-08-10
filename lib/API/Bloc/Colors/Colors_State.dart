import 'dart:ui';

import 'package:equatable/equatable.dart';

abstract class ColorState extends Equatable {
  const ColorState();

  @override
  List<Object> get props => [];
}

class ColorInitial extends ColorState {}

class ColorLoading extends ColorState {}

class ColorLoaded extends ColorState {
  final List<Color> colors;

  const ColorLoaded(this.colors);

  @override
  List<Object> get props => [colors];
}

class ColorError extends ColorState {}
