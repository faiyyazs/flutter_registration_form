import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:registration_form/app/main/app_vm.dart';
import 'package:registration_form/app/navigation/route_paths.dart';
import 'package:registration_form/app/navigation/router.dart';
import 'package:registration_form/generated/l10n.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
        ],
        supportedLocales: S.delegate.supportedLocales,
        onGenerateTitle: (context) => S.of(context).appName,
        debugShowCheckedModeBanner: false,
        theme: Provider.of<AppVM>(context).theme,
        initialRoute: RoutePaths.Splash,
        onGenerateRoute: AppRouter.generateRoute);
  }
}
