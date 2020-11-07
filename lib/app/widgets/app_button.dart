import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:registration_form/app/base/base_vm.dart';
import 'package:registration_form/app/base/base_widget.dart';
import 'package:registration_form/app/constants/app_colors.dart';

class AppButton extends StatelessWidget {
  final BaseVM model;
  final double height;
  final double width;
  final Widget child;
  final Function(BaseVM model) onPressed;
  final Color color;

  AppButton({
    Key key,
    this.height: 24,
    this.child,
    this.model,
    @required this.onPressed,
    this.width,
    this.color: AppColors.primaryColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseWidget<BaseVM>(
        viewModel: model == null ? BaseVM() : model,
        builder: (context, model, child) => SizedBox(
              width: this.width,
              height: this.height,
              child: IgnorePointer(
                  ignoring: model.busy,
                  child: FlatButton(
                    color: color,
                    disabledColor: color.withOpacity(0.5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                    ),
                    child: Ink(
                        child: Container(
                      alignment: Alignment.center,
                      child: model.busy
                          ? SizedBox(
                              height: height / 2,
                              width: height / 2,
                              child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      AppColors.white),
                                  strokeWidth: 3.0))
                          : this.child,
                    )),
                    onPressed: !model.busy
                        ? () {
                            try {
                              onPressed(model);
                            } catch (e) {
                              print("Exception" + e.toString());
                            }
                          }
                        : null,
                  )),
            ));
  }
}
