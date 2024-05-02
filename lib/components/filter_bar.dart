import 'package:flutter/material.dart';

class FilterBar extends StatelessWidget {

  bool bikeFilter;


  FilterBar({super.key, required this.bikeFilter});

  @override
  Widget build(BuildContext context) {
    return Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 18),
                decoration: BoxDecoration(
                  color: bikeFilter == true ? Colors.grey : null,
                  border: Border.all(color: Colors.grey)
                ),
                width: MediaQuery.of(context).size.width / 2,
                child: const Text(
                  'Moto',
                  textAlign: TextAlign.center,
                ),
              ),
              Divider(
                color: Colors.black,
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 18),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey)
                ),
                width: MediaQuery.of(context).size.width / 2,
                child: const Text(
                  'Carro',
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          );
  }
}