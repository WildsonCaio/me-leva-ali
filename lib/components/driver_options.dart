import 'package:flutter/material.dart';

class DriverOptions extends StatefulWidget {
  Function? vehiclemodel;
  Function? vehicletype;

  DriverOptions({super.key, this.vehiclemodel, this.vehicletype});

  @override
  State<DriverOptions> createState() => _DriverOptionsState();
}

var typeVehicle = listVehicle.first;
  List listVehicle = ['Selecione o Veículo','Carro', 'Moto'];

class _DriverOptionsState extends State<DriverOptions> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 5),
          padding: EdgeInsets.all(10),
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
              border: Border.all(), borderRadius: BorderRadius.circular(8)),
          child: DropdownButton(
            underline: null,
            value: typeVehicle,
            hint: Text('Selecione o Veículo'),
            borderRadius: BorderRadius.circular(12),
            style:
                TextStyle(color: Colors.black, decoration: TextDecoration.none),
            items: listVehicle.map((value) {
              return DropdownMenuItem(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                typeVehicle = value.toString();
                widget.vehicletype!(value);
              });
            },
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 5),
          child: TextFormField(
            onChanged: (value) {
              setState(() {
                widget.vehiclemodel!(value);
              });
            },
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Erro';
              }
            },
            decoration: InputDecoration(
              labelText: 'Ex.: Titan, Biz, Corsa, Kwid, Fan, Uno-*',
              border: OutlineInputBorder(),
            ),
          ),
        )
      ],
    );
  }
}
