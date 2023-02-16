import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/src/configuration/services/configuration_service.dart';

class AppStore {

  final themeMode = ValueNotifier(ThemeMode.system);
  final syncDate = ValueNotifier<DateTime?>(null);
  final ConfigurationService _configurationService;

  AppStore(this._configurationService){
    init();
  }

  void init(){
    final model = _configurationService.getConfiguration();
    syncDate.value = model.syncDate;
    themeMode.value = getThemeModeByName(model.themeModeName);
  }

  void save(){
    _configurationService.saveConfiguration(
        themeMode.value.name,
        syncDate.value
    );
  }

  void deleteCacheApp(){
    _configurationService.deleteAll();
  }

  void changeThemeMode(ThemeMode? mode){
    if(mode != null){
      themeMode.value = mode;
      save();
    }
  }

  void setSyncDate(DateTime dateTime) {
    syncDate.value = dateTime;
    save();
  }

  ThemeMode getThemeModeByName(String name){
    return ThemeMode.values.firstWhere((element) => element.name == name);
  }

}