import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:registration_form/app/base/base_page.dart';
import 'package:registration_form/app/constants/app_colors.dart';
import 'package:registration_form/app/feature/reviewdata/ktpaddressdata_view.dart';
import 'package:registration_form/app/navigation/route_paths.dart';
import 'package:registration_form/data/model/ktpaddress.dart';
import 'package:registration_form/data/model/personal.dart';
import 'package:registration_form/generated/l10n.dart';

import 'ktpaddressdata_mobile_view.dart';
import 'ktpaddressdata_vm.dart';
import 'provincelist_vm.dart';

class KtpAddressDataView extends BasePage<KtpAddressDataVM> {
  final Personal personal;

  KtpAddressDataView(this.personal);

  @override
  _KtpAddressDataViewState createState() => _KtpAddressDataViewState();
}

class _KtpAddressDataViewState
    extends BaseStatefulPage<KtpAddressDataVM, KtpAddressDataView> {
  @override
  Widget buildAppbar() {
    return AppBar(
      backgroundColor: AppColors.transparent,
      actions: <Widget>[
        IconButton(
          iconSize: 15,
          icon: Icon(Icons.arrow_forward_ios),
          onPressed: () {
            getViewModel().submit(
              S.of(context),
              getViewModel().proviceListVM.selectedProvince,
              getViewModel().selectedResidence,
              getViewModel().ecBlockNumber.text,
              getViewModel().ecDescription.text,
            );
          },
        ),
      ],
      centerTitle: true,
      title: Text(
        S.of(context).ktpAddress,
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
  void onModelReady(KtpAddressDataVM model) {
    super.onModelReady(model);
    model.proviceListVM.getProvices();
    model.ktpAddressState.listen((value) {
      if (value.isSuccess) {
        if (value.data != null) {
          toReviewStep(value.data);
        }
        return;
      }
      showSnackBar(value.message);
    });
  }

  showSnackBar(String message) {
    super.scaffoldKey.currentState.showSnackBar(SnackBar(
          backgroundColor: AppColors.black,
          content: Row(
            children: [
              Text(
                message,
                style: TextStyle(color: AppColors.white),
              ),
            ],
          ),
        ));
  }

  @override
  Widget buildMobilePortrait(BuildContext context) {
    return KtpAddressDataMobileView();
  }

  @override
  KtpAddressDataVM initViewModel() {
    return KtpAddressDataVM(ProvinceListVM(Provider.of(context)));
  }

  void toReviewStep(KtpAddress ktpAddress) {
    Navigator.pushNamed(context, RoutePaths.ReviewData,
        arguments: ReviewDataViewParams(widget.personal, ktpAddress));
  }
}
