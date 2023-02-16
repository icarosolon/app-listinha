import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo/src/shared/stores/app_store.dart';
import 'package:todo/src/shared/themes/themes.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Modular.setInitialRoute('/home/');
    final appStore = context.watch<AppStore>(
      (store) => store.themeMode
    );

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        themeMode: appStore.themeMode.value,
        theme: lightTheme,
        darkTheme: darkTheme,
        routerDelegate: Modular.routerDelegate,
        routeInformationParser: Modular.routeInformationParser,
    );
  }
}