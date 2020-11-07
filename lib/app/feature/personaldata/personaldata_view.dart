import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:registration_form/app/base/base_page.dart';
import 'package:registration_form/app/constants/app_colors.dart';
import 'package:registration_form/app/navigation/route_paths.dart';
import 'package:registration_form/data/model/personal.dart';
import 'package:registration_form/generated/l10n.dart';

import 'personaldata_mobile_view.dart';
import 'personaldata_vm.dart';

class PersonalDataView extends BasePage<PersonalDataVM> {
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState
    extends BaseStatefulPage<PersonalDataVM, PersonalDataView> {
  @override
  Widget buildAppbar() {
    return AppBar(
      backgroundColor: AppColors.transparent,
      actions: <Widget>[
        IconButton(
          iconSize: 15,
          icon: Icon(Icons.arrow_forward_ios),
          onPressed: () async {
            getViewModel().submit(
              S.of(context),
              getViewModel().idEC.text,
              getViewModel().nameEC.text,
              getViewModel().accNumEC.text,
              getViewModel().selectedEducationLevel,
              getViewModel().selectedDate,
            );
          },
        ),
      ],
      centerTitle: true,
      title: Text(
        S.of(context).personalData,
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
  void onModelReady(PersonalDataVM model) {
    super.onModelReady(model);
    model.personalDataState.listen((value) {
      if (value.isSuccess) {
        if (value.data != null) {
          toAddressStep(value.data);
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
    return PersonalDataMobileView();
  }

  @override
  PersonalDataVM initViewModel() {
    return PersonalDataVM();
  }

  void toAddressStep(Personal personalData) {
    Navigator.pushNamed(context, RoutePaths.AddressData,
        arguments: personalData);
  }
}
