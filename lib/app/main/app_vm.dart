import 'package:flutter/material.dart';
import 'package:registration_form/app/base/base_vm.dart';
import 'package:registration_form/app/constants/app_colors.dart';
import 'package:registration_form/app/constants/app_theme.dart';

class AppVM extends BaseVM {
  AppTheme _theme = AppTheme.primary;
  ThemeData _themeData = ThemeData.dark();

  ThemeData get theme {
    switch (_theme) {
      case AppTheme.primary:
      default:
        return _themeData.copyWith(
          accentColor: AppColors.primaryColor,
          primaryColor: AppColors.primaryColor,
          cursorColor: AppColors.primaryColor,
          textSelectionHandleColor: AppColors.primaryColor,
          textSelectionColor: AppColors.gray,
          inputDecorationTheme: InputDecorationTheme(
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.white, width: 1)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.gray, width: 1.55)),
            errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.white, width: 1.55)),
            focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.white, width: 1.55)),
            errorStyle: TextStyle(
              color: AppColors.white,
            ),
            labelStyle: TextStyle(
              color: AppColors.gray,
              fontFamily: 'Barlow',
            ),
          ),
          textTheme: _themeData.textTheme.apply(fontFamily: 'Barlow'),
          accentTextTheme:
              _themeData.accentTextTheme.apply(fontFamily: 'Barlow'),
          primaryTextTheme:
              _themeData.primaryTextTheme.apply(fontFamily: 'Barlow'),
          iconTheme: IconThemeData(
            color: AppColors.primaryColor,
          ),
        );
    }
  }
}
