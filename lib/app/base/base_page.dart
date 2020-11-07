import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:registration_form/app/constants/app_colors.dart';
import 'package:registration_form/app/main/app_vm.dart';

import 'base_vm.dart';
import 'base_widget.dart';

/// Every Page/View should be inherited from this
abstract class BasePage<VM extends BaseVM> extends StatefulWidget {
  BasePage({Key key}) : super(key: key);
}

abstract class BasePageState<VM extends BaseVM, T extends BasePage<VM>>
    extends State<T> {}

abstract class BaseStatefulPage<VM extends BaseVM, B extends BasePage<VM>>
    extends BasePageState<VM, B> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  VM _viewModel;
  ThemeData _theme;

  @override
  Widget build(BuildContext context) {
    if (_viewModel == null || getViewModel() != _viewModel) {
      /// We have not used singleton as we want to have a unique state for each page.
      /// This page may contain multiple other ViewModels to avoid reloading on entire page.
      _viewModel = initViewModel();
    }
    return _getLayout();
  }

  void _onBaseModelReady(VM model) {
    _theme = Provider.of<AppVM>(context).theme;
    onModelReady(model);
  }

  get theme => _theme;

  /// Returns viewModel of the screen
  VM getViewModel() {
    return _viewModel;
  }

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  /// Actual Screen which load scaffold and load UI
  Widget _getLayout() {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: AppColors.black,
      ),
      child: BaseWidget<VM>(
          viewModel: getViewModel(),
          onModelReady: _onBaseModelReady,
          builder: (BuildContext context, VM model, Widget child) {
            return Scaffold(
                key: _scaffoldKey,
                appBar: buildAppbar(),
                body: _buildScafoldBody());
          }),
    );
  }

  /// Building a appbar of screen
  Widget buildAppbar() {
    return null;
  }

  Widget _buildScafoldBody() {
    return ScreenTypeLayout(mobile: _buildMobileLayout());
  }

  /*Mandatory*/

  /// You can setup load something when model is ready, Ex: Load or fetch some data from remote layer
  void onModelReady(VM model) {}

  Widget _buildMobileLayout() {
    return OrientationLayoutBuilder(
      portrait: (context) => buildMobilePortrait(context),
      landscape: (context) => buildMobileLandscape(context),
    );
  }

  Widget buildMobilePortrait(BuildContext context) {
    return null;
  }

  Widget buildMobileLandscape(BuildContext context) {
    return null;
  }

  /// Declare and initialization of viewModel for the page
  VM initViewModel();

  @override
  void dispose() {
    getViewModel().dispose();
    super.dispose();
  }
}

abstract class BasePageViewWidget<T> extends Widget {
  @protected
  Widget build(BuildContext context, T model);

  @override
  DataProviderElement<T> createElement() => DataProviderElement<T>(this);
}

class DataProviderElement<T> extends ComponentElement {
  DataProviderElement(BasePageViewWidget widget) : super(widget);

  @override
  BasePageViewWidget get widget => super.widget;

  @override
  Widget build() {
    return widget.build(this, Provider.of<T>(this));
  }

  @override
  void update(BasePageViewWidget newWidget) {
    super.update(newWidget);
    assert(widget == newWidget);
    rebuild();
  }
}
