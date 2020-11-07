import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:registration_form/app/base/base_page.dart';
import 'package:registration_form/app/constants/app_colors.dart';
import 'package:registration_form/app/navigation/route_paths.dart';

import 'splasvm.dart';

class SplashView extends BasePage<SplashVM> {
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends BaseStatefulPage<SplashVM, SplashView> {
  @override
  void onModelReady(SplashVM model) {
    getViewModel().onBoardUser.listen((value) {
      if (value) {
        Navigator.pushReplacementNamed(context, RoutePaths.PersonalData);
      }
    });
  }

  @override
  Widget buildMobilePortrait(BuildContext context) {
    return Stack(fit: StackFit.loose, children: [
      Container(
        color: AppColors.primaryColor,
      ),
      Center(
        child: Icon(Icons.person_pin, size: 100, color: AppColors.black),
      ),
    ]);
  }

  @override
  SplashVM initViewModel() {
    return SplashVM();
  }
}
