import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:todo/src/shared/stores/app_store.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appStore = context.watch<AppStore>(
        (store) => store.syncDate,
    );

    final syncDate = appStore.syncDate.value;

    var syncDateText = 'Nunca';

    if(syncDate != null){
      final format = DateFormat('dd/MM/yyyy às hh:mm');
      syncDateText = format.format(syncDate);
    }

    return NavigationDrawer(
      onDestinationSelected: (index){
        if (index == 1){
          Navigator.of(context).pop();
          Navigator.of(context).pushNamed('/config');
        }
      },
      children: [
        Padding(
          padding: EdgeInsets.only(top: 28.0, bottom: 16.0, right: 16.0, left: 16.0),
          child: Text('Opções',
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        NavigationDrawerDestination(
            icon: Icon(Icons.sync),
            label: SizedBox(
              width: 210,
              child: Row(
                children: [
                  Text('Sincronizar'),
                  const Spacer(),
                  SizedBox(width: 28,),
                  Text(syncDateText,
                  style: Theme.of(context).textTheme.bodySmall,)
                ],
              ),
            )),
        NavigationDrawerDestination(icon: Icon(Icons.settings), label: Text('Configurações')),
      ],
    );
  }
}
