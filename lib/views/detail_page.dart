import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {

  const DetailPage({Key? key, });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text('Wildson'),
            actions: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: CircleAvatar(),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                  height: 200,
                  color: Colors.grey,
                  child: Image.network(
                      'https://source.unsplash.com/800x400/?moto'),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Nome', style: TextStyle(fontSize: 20)),
                          Text('Wildson', style: TextStyle(fontSize: 20)),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Contato', style: TextStyle(fontSize: 20)),
                          Text('48988157712', style: TextStyle(fontSize: 20)),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Horários', style: TextStyle(fontSize: 20)),
                          Text('21 ás 23', style: TextStyle(fontSize: 20)),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Status', style: TextStyle(fontSize: 20)),
                          Text('Online', style: TextStyle(fontSize: 20)),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(top: 12, bottom: 4),
                    child: Text(
                      'Avaliações',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  padding: EdgeInsets.symmetric(vertical: 4),
                  margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(12)),
                  child: ListTile(
                    title: Text('Usuario'),
                    subtitle: Text(
                      'Nossa viagem pela Rota da Serra da Graciosa foi uma experiência verdadeiramente inesquecível. As paisagens deslumbrantes, a sensação de liberdade e a rica cultura local tornaram essa aventura de moto uma das melhores que já vivenciamos. Mal podemos esperar para planejar nossa próxima jornada nas estradas!',
                      textAlign: TextAlign.justify,
                    ),
                    leading: CircleAvatar(),
                  ),
                );
              },
              childCount: 10,
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: () {},
            child: Icon(Icons.thumb_up),
            backgroundColor: Colors.green,
          ),
          SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            onPressed: () {},
            child: Icon(Icons.thumb_down),
            backgroundColor: Colors.red,
          ),
        ],
      ),
    );
  }
}
