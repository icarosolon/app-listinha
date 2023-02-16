import 'package:realm/realm.dart';
import 'package:todo/src/shared/services/realm/models/configuration_model.dart';

LocalConfiguration configuration = Configuration.local([
  ConfigurationModel.schema
], 
    initialDataCallback: (realm) {
  realm.add(ConfigurationModel('system'));
    },
  // path: './realm/realm.db'
);

