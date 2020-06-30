import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  const CardPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Card page'),
      ),
      body: ListView(
        children: <Widget>[
          _cardtipo1(),
        ],
        padding: EdgeInsets.all(10.0),
      ),
    );
  }

  Widget _cardtipo1() {
    return Card(
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.photo_album, color: Colors.blue,),
            title: Text('Titulo de la tarjeta'),
            subtitle: Text('elit dolore proident tempor nostrud velit adipisicing. Lorem anim minim sit esse veniam aute proident quis.'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                child: Text('Cancelar'),
                onPressed: (){
                  // Click
                },
              ),
              FlatButton(
                child: Text('Ok'),
                onPressed: (){
                  // Click
                },
              )
            ],
          )
        ],
      ),
    );
  }
}