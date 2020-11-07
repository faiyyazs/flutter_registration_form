import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:registration_form/app/base/base_vm.dart';
import 'package:registration_form/app/base/base_widget.dart';
import 'package:registration_form/app/constants/app_colors.dart';

class AppTextField<T extends BaseVM> extends StatelessWidget {
  final T viewModel;
  final double height;
  final double width;
  final Widget child;
  final Function(T model) onPressed;
  final TextEditingController controller;
  final TextInputAction inputAction;
  final TextInputType inputType;
  final String labelText;
  final String hintText;
  final String initialValue;
  final bool autofocus;
  final Function(String) validator;
  final Function(String) onSaved;
  final bool readOnly;
  final int maxLength;
  final Key key;

  AppTextField({
    this.key,
    this.viewModel,
    this.height,
    this.width,
    this.maxLength,
    this.onPressed,
    this.child,
    this.controller,
    this.inputAction,
    this.inputType,
    this.labelText,
    this.hintText,
    this.autofocus: false,
    this.validator,
    this.onSaved,
    this.readOnly: false,
    this.initialValue,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return BaseWidget<T>(
        viewModel: viewModel,
        builder: (context, T model, child) {
          return SizedBox(
              width: this.width,
              height: this.height,
              child: TextFormField(
                key: this.key,
                maxLength: maxLength,
                initialValue: initialValue,
                autofocus: autofocus,
                textInputAction: inputAction,
                keyboardType: inputType,
                readOnly: readOnly,
                style: TextStyle(
                  fontFamily: 'Barlow',
                  color: AppColors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                ),
                decoration: InputDecoration(
                  labelStyle: TextStyle(
                    fontFamily: 'Barlow',
                    color: AppColors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.normal,
                  ),
                  labelText: labelText,
                  hintText: hintText,
                  counterText: "",
                ),
                controller: controller,
                validator: this.validator,
                onSaved: this.onSaved,
              ));
        });
  }
}
