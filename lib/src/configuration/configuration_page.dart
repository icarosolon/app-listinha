import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo/src/shared/stores/app_store.dart';

class ConfigurationPage extends StatelessWidget {
  const ConfigurationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final appStore = context.watch<AppStore>(
            (store) => store.themeMode
    );

    return Scaffold(
      appBar: AppBar(title: Text('LISTINHA')),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20,20,20,0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Configurações',
            style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(height: 20,),
            Text('Tema',
            style: Theme.of(context).textTheme.titleMedium,),
            SizedBox(height: 10,),
            RadioListTile(
              title: Text('Sistema'),
              value: ThemeMode.system,
              groupValue: appStore.themeMode.value,
              onChanged: appStore.changeThemeMode
            ),
            RadioListTile(
              title: Text('Claro'),
              value: ThemeMode.light,
              groupValue: appStore.themeMode.value,
              onChanged: appStore.changeThemeMode
            ),
            RadioListTile(
              title: Text('Escuro'),
              value: ThemeMode.dark,
              groupValue: appStore.themeMode.value,
              onChanged: appStore.changeThemeMode
            ),
            SizedBox(height: 20,),
            Text('Controle de dadods',
            style: Theme.of(context).textTheme.titleMedium,),
            SizedBox(height: 10,),
            OutlinedButton(
                onPressed: appStore.deleteCacheApp,
                child: const Text('Apagar cache e reiniciar app'),
            )
          ],
        ),
      ),
    );
  }
}
