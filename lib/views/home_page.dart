import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:me_leva_ali/components/driver_list.dart';
import 'package:me_leva_ali/components/filter_bar.dart';
import 'package:me_leva_ali/components/side_options.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool motoActive = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ME LEVA ALI'),
        centerTitle: true,
      ),
      drawer: SideOptions(),
      body: Column(
        children: [
          FilterBar(
            bikeFilter: false,
          ),
          Expanded(
            child: DriverList()
          )
        ],
      ),
    );
  }
}
