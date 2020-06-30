import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  final opciones = ['Uno', 'Dos', 'Tres', 'Cuatro', 'Cinco'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes temp!')
      ),
      body: ListView(
        children: _crearItemsCorto()
      ),
    );
  }

  List<Widget> _crearItems(){
    List<Widget> list = new List<Widget>();
    opciones.forEach((e) {
      list..add(ListTile(
        title: Text(e),
      ))..add(Divider());
    });
    return list;
  }

  List<Widget> _crearItemsCorto(){
    return opciones.map((e) => Column(
      children: <Widget>[
        ListTile(
          title: Text('Titulo ListTile #' + e),
          subtitle: Text('Subtitulo del listTile'),
          leading: Icon(Icons.accessible_forward),
          trailing: Icon(Icons.arrow_forward),
          onTap: (){
            // Click event
          },
        ),
        Divider()
      ],
    )).toList();
  }
}