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
          SizedBox(height: 30.0), // Creamos un espacio entre las tarjetas
          _cardtipo2(),
          SizedBox(height: 30.0), 
          _cardtipo1(),
          SizedBox(height: 30.0), 
          _cardtipo2(),
          SizedBox(height: 30.0), 
          _cardtipo1(),
          SizedBox(height: 30.0), 
          _cardtipo2(),
        ],
        padding: EdgeInsets.all(10.0),
      ),
    );
  }

  Widget _cardtipo1() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
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

 Widget _cardtipo2() {
   final card = Container(
     child: Column(
       children: <Widget>[
         FadeInImage(
           placeholder: AssetImage('assets/jar-loading.gif'),
           image: NetworkImage('https://static.vecteezy.com/system/resources/thumbnails/000/246/312/original/mountain-lake-sunset-landscape-first-person-view.jpg'),
           fit: BoxFit.fill,
         ),
         Container(
          child: Text('Tarjeta con imagen.'),
          padding: EdgeInsets.all(10.0),
        )
       ],
     )
   );

   return Container(
     decoration: BoxDecoration(
       borderRadius: BorderRadius.circular(30.0),
       color: Colors.white,
       boxShadow: <BoxShadow> [
         BoxShadow(
           color: Colors.black26,
           blurRadius: 10.0,
           spreadRadius: 1.0,
           offset: Offset(1.0, 1.0)
         ),
       ],
     ),
     child: ClipRRect(
       borderRadius: BorderRadius.circular(30.0),
       child: card,
     ),
   );
 }

}