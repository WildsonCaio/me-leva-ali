import 'package:flutter/material.dart';
import 'package:me_leva_ali/services/firebase_service.dart';
import 'package:me_leva_ali/views/login_page.dart';
import 'package:me_leva_ali/views/search_page.dart';

class SideOptions extends StatelessWidget {
  const SideOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              child: Text('W'),
            ),
            accountName: Text('accountName'),
            accountEmail: Text('accountEmail'),
          ),
          const ListTile(
            title: Text('Favoritos'),
            trailing: Icon(Icons.favorite),
          ),
          Divider(),
          ListTile(
            title: Text('Buscar Motorista'),
            trailing: Icon(Icons.search),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SearchPage(),
                ),
              );
            },
          ),
          Divider(),
          ListTile(
            title: Text('Sobre o App'),
            trailing: Icon(Icons.info),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SearchPage(),
                ),
              );
            },
          ),
          Divider(),
          ListTile(
            title: Text('Sair'),
            trailing: Icon(Icons.exit_to_app),
            onTap: () async {
              await logout();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginPage(),
                ),
              );
            },
          ),
          Divider(),
        ],
      ),
    );
  }
}
