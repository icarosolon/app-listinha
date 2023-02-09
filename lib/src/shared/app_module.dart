import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo/src/configuration/configuration_page.dart';
import 'package:todo/src/shared/home_module.dart';

class AppModule extends Module {

  @override
  List<ModularRoute> get routes => [
    ModuleRoute('/', module: HomeModule()),
    ChildRoute('/config', child: (context,args) => const ConfigurationPage())
  ];
}