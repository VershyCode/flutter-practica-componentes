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
    return opciones.map((e) => ListTile(
      title: Text(e + ' test'),
    )).toList();
  }
}