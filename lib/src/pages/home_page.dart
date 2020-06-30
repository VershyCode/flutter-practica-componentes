import 'package:flutter/material.dart';
import 'package:components/src/providers/menu_provider.dart';
import 'package:components/src/utils/icon_string_util.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Components')
      ),
      body: _lista(),
    );
  }
  Widget _lista() {
    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot){
        return ListView(
          children: _listaItems(snapshot.data, context),
        );
      },
    );
  }
  List<Widget> _listaItems(List<dynamic> data, BuildContext context) {
    return data.map((e) => Column(
      children: <Widget>[
        ListTile(
          title: Text(e['texto']),
          subtitle: Text('Descripcion aqui'),
          leading: getIcon(e['icon']),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: (){
            // Event click
            Navigator.pushNamed(context, e['ruta']);
          },
        ),
        Divider(),
      ],
    )).toList();
  }
}