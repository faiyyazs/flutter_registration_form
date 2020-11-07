import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:registration_form/app/base/base_page.dart';
import 'package:registration_form/app/base/base_vm.dart';
import 'package:registration_form/app/constants/app_colors.dart';
import 'package:registration_form/app/navigation/route_paths.dart';
import 'package:registration_form/app/widgets/app_button.dart';
import 'package:registration_form/generated/l10n.dart';

import 'reviewdata_vm.dart';
import 'widget/infowidget.dart';

class ReviewDataMobileView extends BasePageViewWidget<ReviewDataVM> {
  @override
  Widget build(BuildContext context, ReviewDataVM model) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          top: 2,
                        ),
                        child: Text(S.of(context).threeOfThree,
                            style: TextStyle(
                              color: AppColors.gray,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              fontSize: 14,
                            ),
                            textAlign: TextAlign.center),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          left: 10,
                          right: 10,
                          top: 10,
                        ),
                        child: Column(
                          children: [
                            InformationWidget(
                              title: S.of(context).IdCardNum,
                              description: model.params.personal.ktpId,
                            ),
                            InformationWidget(
                              title: S.of(context).fullName,
                              description: model.params.personal.name,
                            ),
                            InformationWidget(
                              title: S.of(context).eduLevel,
                              description: model.params.personal.educationLevel,
                            ),
                            InformationWidget(
                              title: S.of(context).chooseDOB,
                              description: model.params.personal.dob,
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                left: 12,
                                right: 12,
                                top: 20,
                              ),
                              child: Divider(
                                height: 1,
                                color: AppColors.warm_grey,
                              ),
                            ),
                            InformationWidget(
                              title: S.of(context).province,
                              description: model.params.ktpAddress.provinse,
                            ),
                            InformationWidget(
                              title: S.of(context).typeOfResidence,
                              description: model.params.ktpAddress.residence,
                            ),
                            InformationWidget(
                                title: S.of(context).blockNumber,
                                description:
                                    model.params.ktpAddress.blockNumber),
                            InformationWidget(
                                title: S.of(context).ktpAddress,
                                description:
                                    model.params.ktpAddress.fullAddress),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 5,
              bottom: 5,
            ),
            child: AppButton(
              onPressed: (BaseVM buttonVM) async {
                Navigator.pushNamedAndRemoveUntil(
                    context, RoutePaths.Splash, ModalRoute.withName('/'));
              },
              height: 44,
              child: Center(
                child: Text(
                  S.of(context).finish,
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
