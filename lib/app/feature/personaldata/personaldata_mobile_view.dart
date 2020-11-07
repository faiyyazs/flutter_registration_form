import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:registration_form/app/base/base_page.dart';
import 'package:registration_form/app/base/base_vm.dart';
import 'package:registration_form/app/constants/app_colors.dart';
import 'package:registration_form/app/helpers/datetimehelper.dart';
import 'package:registration_form/app/widgets/app_button.dart';
import 'package:registration_form/app/widgets/app_textfield.dart';
import 'package:registration_form/generated/l10n.dart';

import 'constants/education.dart';
import 'personaldata_vm.dart';

class PersonalDataMobileView extends BasePageViewWidget<PersonalDataVM> {
  @override
  Widget build(BuildContext context, PersonalDataVM model) {
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
                  child: Text(S.of(context).oneOfThree,
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
                      Padding(
                        padding: EdgeInsets.only(
                          top: 10,
                        ),
                        child: AppTextField(
                          controller: model.idEC,
                          labelText: S.of(context).IdCardNum,
                          hintText: S.of(context).ktpNumber,
                          maxLength: 16,
                          width: 312,
                          autofocus: true,
                          inputType: TextInputType.number,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 10,
                        ),
                        child: AppTextField(
                          controller: model.nameEC,
                          labelText: S.of(context).fullName,
                          hintText: S.of(context).enterFullName,
                          maxLength: 10,
                          width: 312,
                          autofocus: true,
                          inputType: TextInputType.text,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 10,
                        ),
                        child: AppTextField(
                          controller: model.accNumEC,
                          labelText: S.of(context).accounNum,
                          hintText: S.of(context).enterAccNum,
                          width: 312,
                          autofocus: true,
                          inputType: TextInputType.number,
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
                                  S.of(context).eduLevel,
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
                                child: DropdownButton<EducationLevel>(
                                  isDense: true,
                                  isExpanded: true,
                                  itemHeight: 80,
                                  onChanged: (EducationLevel value) {
                                    model.selectedEducationLevel = value;
                                  },
                                  value: model.selectedEducationLevel,
                                  items: EducationLevel.values
                                      .map((EducationLevel e) =>
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
                          top: 12,
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  S.of(context).chooseDOB,
                                  style: TextStyle(
                                      letterSpacing: 1,
                                      color: AppColors.gray,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Expanded(
                                  child: FlatButton(
                                    child: Text(
                                      '${DateTimeHelper.convertDateTimeToCustomFormatDate(model.selectedDate)}',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    onPressed: () {
                                      showPicker(context, model);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 20,
                  ),
                  child: AppButton(
                    onPressed: (BaseVM buttonVM) async {
                      buttonVM.setBusy(true);
                      model.submit(
                        S.of(context),
                        model.idEC.text,
                        model.nameEC.text,
                        model.accNumEC.text,
                        model.selectedEducationLevel,
                        model.selectedDate,
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

  Future<Null> showPicker(BuildContext context, PersonalDataVM model) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2101));

    if (picked != null && picked != model.selectedDate) {
      model.selectedDate = picked;
    }
  }
}
