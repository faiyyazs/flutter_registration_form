import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:registration_form/app/base/base_widget.dart';
import 'package:registration_form/data/di/providers.dart';
import 'package:registration_form/domain/di/providers.dart';

import '../di/providers.dart';
import 'app.dart';
import 'app_vm.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runZoned(() {
    runApp(
      MultiProvider(providers: [
        ...dataProviders,
        ...domainProviders,
        ...appProviders,
      ], child: MainApp()),
    );
  });
  // entry point for the app
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseWidget<AppVM>(
      viewModel: AppVM(),
      builder: (context, model, child) => App(),
    );
  }
}
