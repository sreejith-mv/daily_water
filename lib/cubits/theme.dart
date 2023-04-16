import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeCubit extends Cubit<ThemeData> {
  //states

  static final light = ThemeData.light();
  static final dark = ThemeData.dark();
  static final amber =
      ThemeData(primarySwatch: Colors.amber, fontFamily: 'Montserrat');
  static final brown =
      ThemeData(primarySwatch: Colors.brown, fontFamily: 'Noto Sans');

  static final purple =
      ThemeData(primarySwatch: Colors.purple, fontFamily: 'Montserrat');
  static final green =
      ThemeData(primarySwatch: Colors.green, fontFamily: 'Noto Sans');

  ThemeCubit() : super(light);

  void toggleTheme(String color) {
    switch (color) {
      case 'brown':
        emit(brown);
        break;
      case 'amber':
        emit(amber);
        break;
      case 'purple':
        emit(purple);
        break;
      case 'green':
        emit(green);
        break;
      case 'light':
        emit(light);
        break;
      case 'dark':
        emit(dark);
        break;
      default:
        emit(light);
    }
  }
}
