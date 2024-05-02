import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:me_leva_ali/components/driver_list.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buscar Motorista'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                  hintText: 'Ex.: Marcos, Edson, Marta.....',
                  border: OutlineInputBorder()),
            ),
            Expanded(
              child: DriverList()
            )
          ],
        ),
      ),
    );
  }
}
