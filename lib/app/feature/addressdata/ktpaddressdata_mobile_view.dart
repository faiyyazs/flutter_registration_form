import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:registration_form/app/base/base_page.dart';
import 'package:registration_form/app/base/base_vm.dart';
import 'package:registration_form/app/base/base_widget.dart';
import 'package:registration_form/app/constants/app_colors.dart';
import 'package:registration_form/app/feature/addressdata/constants/residence.dart';
import 'package:registration_form/app/widgets/app_button.dart';
import 'package:registration_form/app/widgets/app_textfield.dart';
import 'package:registration_form/domain/model/province.dart';
import 'package:registration_form/generated/l10n.dart';

import 'ktpaddressdata_vm.dart';
import 'provincelist_vm.dart';

class KtpAddressDataMobileView extends BasePageViewWidget<KtpAddressDataVM> {
  @override
  Widget build(BuildContext context, KtpAddressDataVM model) {
    return SafeArea(
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
                  child: Text(S.of(context).twoOfThree,
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
                      Container(
                        margin: EdgeInsets.only(
                          left: 12,
                          right: 12,
                          top: 20,
                        ),
                        child: BaseWidget<ProvinceListVM>(
                          viewModel: model.proviceListVM,
                          builder: (context, provinceModel, child) => Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    S.of(context).province,
                                    style: TextStyle(
                                        color: AppColors.gray,
                                        letterSpacing: 1,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  model.proviceListVM.busy
                                      ? Container(
                                          margin: EdgeInsets.only(
                                              left: 8, right: 8),
                                          height: 12,
                                          width: 12,
                                          child: CircularProgressIndicator())
                                      : Visibility(
                                          visible: model.proviceListVM.error,
                                          child: InkWell(
                                            onTap: () {
                                              provinceModel.getProvices();
                                            },
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 8),
                                              child: Text(
                                                S.of(context).retry,
                                                style: TextStyle(
                                                    color:
                                                        AppColors.primaryColor),
                                              ),
                                            ),
                                          ),
                                        ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  top: 12,
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<Province>(
                                    isDense: true,
                                    isExpanded: true,
                                    itemHeight: 80,
                                    onChanged: (Province value) {
                                      provinceModel.selectedProvince = value;
                                    },
                                    hint: Text(""),
                                    value: provinceModel.selectedProvince,
                                    items: provinceModel.provinces
                                        .map((Province e) => DropdownMenuItem(
                                            value: e, child: Text("${e.name}")))
                                        .toList(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          left: 12,
                          right: 12,
                          top: 20,
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  S.of(context).typeOfResidence,
                                  style: TextStyle(
                                      letterSpacing: 1,
                                      color: AppColors.gray,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: 12,
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<ResidenceType>(
                                  isDense: true,
                                  isExpanded: true,
                                  itemHeight: 80,
                                  onChanged: (ResidenceType value) {
                                    model.selectedResidence = value;
                                  },
                                  value: model.selectedResidence,
                                  items: ResidenceType.values
                                      .map((ResidenceType e) =>
                                          DropdownMenuItem(
                                              value: e,
                                              child:
                                                  Text("${e.toShortString()}")))
                                      .toList(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          left: 12,
                          right: 12,
                          top: 20,
                        ),
                        child: AppTextField(
                          controller: model.ecBlockNumber,
                          labelText: S.of(context).blockNumber,
                          hintText: S.of(context).enterBlockNumber,
                          autofocus: false,
                          inputType: TextInputType.number,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          left: 12,
                          right: 12,
                          top: 20,
                        ),
                        child: AppTextField(
                          controller: model.ecDescription,
                          labelText: S.of(context).ktpAddress,
                          hintText: S.of(context).enterKtpAddress,
                          autofocus: false,
                          inputType: TextInputType.text,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 20,
                  ),
                  child: AppButton(
                    onPressed: (BaseVM buttonVM) {
                      buttonVM.setBusy(true);
                      model.submit(
                        S.of(context),
                        model.proviceListVM.selectedProvince,
                        model.selectedResidence,
                        model.ecBlockNumber.text,
                        model.ecDescription.text,
                      );
                      buttonVM.setBusy(false);
                    },
                    height: 44,
                    width: 312,
                    child: Center(
                      child: Text(
                        S.of(context).next,
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
          ],
        ),
      ),
    );
  }
}
