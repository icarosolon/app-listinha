import 'package:realm/realm.dart';
import 'package:todo/src/shared/services/realm/models/configuration_model.dart';

abstract class IConfigurationService {
  ConfigurationModel getConfiguration();
  void saveConfiguration(String themeModeName, DateTime? syncDate);
  void deleteAll();
}

class ConfigurationService implements IConfigurationService{
  final Realm realm;

  ConfigurationService(this.realm);

  @override
  ConfigurationModel getConfiguration() {
    return realm.all<ConfigurationModel>().first;
  }

  @override
  void saveConfiguration(String themeModeName, DateTime? syncDate) {
    final model = getConfiguration();
    realm.write((){
      model.themeModeName = themeModeName;
      model.syncDate = syncDate;
    });
  }

  @override
  void deleteAll() {
    realm.deleteAll();
  }


}