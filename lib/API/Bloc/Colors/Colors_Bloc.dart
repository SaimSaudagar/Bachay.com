import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../../Repository/Colors_Repo.dart';
import 'Colors_Event.dart';
import 'Colors_State.dart';

class ColorBloc extends Bloc<ColorEvent, ColorState> {
  final ColorsRepository colorsRepository;

  ColorBloc({required this.colorsRepository}) : super(ColorInitial()) {
    on<LoadColors>(_onLoadColors);
  }

  Future<void> _onLoadColors(
    LoadColors event,
    Emitter<ColorState> emit,
  ) async {
    emit(ColorLoading());
    try {
      final colorsMap = await colorsRepository.fetchColors();
      final colors = colorsMap.values.map((colorHex) => Color(int.parse(colorHex.substring(1), radix: 16) + 0xFF000000)).toList();
      emit(ColorLoaded(colors));
    } catch (e) {
      emit(ColorError());
    }
  }
}
