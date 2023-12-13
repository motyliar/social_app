import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ChangeThemeState(ThemeData.light(useMaterial3: true)));

  void changeThemeData() {
    emit(state == ChangeThemeState(ThemeData.light(useMaterial3: true))
        ? ChangeThemeState(ThemeData.dark(useMaterial3: true))
        : ChangeThemeState(ThemeData.light(useMaterial3: true)));
  }
}
