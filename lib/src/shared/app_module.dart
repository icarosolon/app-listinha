import 'package:flutter_modular/flutter_modular.dart';
import 'package:realm/realm.dart';
import 'package:todo/src/configuration/configuration_page.dart';
import 'package:todo/src/configuration/services/configuration_service.dart';
import 'package:todo/src/shared/home_module.dart';
import 'package:todo/src/shared/services/realm/realm_config.dart';
import 'package:todo/src/shared/stores/app_store.dart';

class AppModule extends Module {



  @override
  List<ModularRoute> get routes => [
    ModuleRoute('/home/', module: HomeModule()),
    ChildRoute('/config', child: (context,args) => const ConfigurationPage())
  ];

  @override
  List<Bind> get binds => [
    Bind.instance<Realm>(Realm(configuration)),
    Bind.singleton((i) => AppStore(i())),
    Bind.factory<IConfigurationService>((i) => ConfigurationService(i())),
    // AutoBind.factory<IConfigurationService>(ConfigurationService.new),
    // AutoBind.singleton(AppStore.new),
  ];
}