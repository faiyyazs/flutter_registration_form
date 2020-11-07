import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:registration_form/app/base/base_page.dart';
import 'package:registration_form/app/constants/app_colors.dart';
import 'package:registration_form/data/model/ktpaddress.dart';
import 'package:registration_form/data/model/personal.dart';
import 'package:registration_form/generated/l10n.dart';

import 'reviewdata_mobile_view.dart';
import 'reviewdata_vm.dart';

class ReviewDataView extends BasePage<ReviewDataVM> {
  final ReviewDataViewParams params;

  ReviewDataView(this.params);

  @override
  _ReviewDataViewState createState() => _ReviewDataViewState();
}

class _ReviewDataViewState
    extends BaseStatefulPage<ReviewDataVM, ReviewDataView> {
  @override
  Widget buildAppbar() {
    return AppBar(
      backgroundColor: AppColors.transparent,
      centerTitle: true,
      title: Text(
        S.of(context).reviewData,
        style: TextStyle(
          fontFamily: 'Barlow',
          color: AppColors.white,
          fontSize: 18,
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.normal,
        ),
      ),
      elevation: 0,
    );
  }

  @override
  Widget buildMobilePortrait(BuildContext context) {
    return ReviewDataMobileView();
  }

  @override
  ReviewDataVM initViewModel() {
    return ReviewDataVM(widget.params);
  }
}

class ReviewDataViewParams {
  final Personal personal;
  final KtpAddress ktpAddress;

  ReviewDataViewParams(this.personal, this.ktpAddress);
}
