import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            label: Row(
              children: [
                Text('Sincronizar'),
                SizedBox(width: 28,),
                Text('09/02/2023 às 03:37',
                style: Theme.of(context).textTheme.bodySmall,)
              ],
            )),
        NavigationDrawerDestination(icon: Icon(Icons.settings), label: Text('Configurações')),
      ],
    );
  }
}
