import 'package:flutter/material.dart';
import 'package:me_leva_ali/views/detail_page.dart';

class DriverList extends StatelessWidget {
  const DriverList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => const Divider(),
      itemCount: 10,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(),
          title: Text('Nome'),
          subtitle: Text('Fazer'),
          trailing: Text('Online'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailPage(),
              ),
            );
          },
        );
      },
    );
  }
}
