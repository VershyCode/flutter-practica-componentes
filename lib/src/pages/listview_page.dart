import 'dart:async';

import 'package:flutter/material.dart';

class ListaPage extends StatefulWidget {
  ListaPage({Key key}) : super(key: key);

  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {
  ScrollController _scrollController = new ScrollController();
  List<int> _listaNumeros = new List();
  int _ultimoNumero = 0;
  bool _isLoading = false;
  
  @override
  void initState() {
    super.initState();
    _agregar10();
    _scrollController.addListener(() {
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        _fechData();
      }
    });
  }
  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text('Listas')
       ),
       body: Stack(
         children: <Widget>[
           _cearLista(),
           _crearLoading(),
         ],
       ),
    );
  }

  Widget _cearLista(){
    return ListView.builder(
      controller: _scrollController,
      itemCount: _listaNumeros.length,
      itemBuilder: (BuildContext context, int index){
        final imagen = _listaNumeros[index];
        return FadeInImage(
          image: NetworkImage('http://picsum.photos/500/300?image=$imagen'),
          placeholder: AssetImage('assets/jar-loading.gif'),
        );
      },
    );
  }

  void _agregar10(){
    for(int i =1; i < 10; i++){
      _ultimoNumero++;
      _listaNumeros.add(_ultimoNumero);
    }
    setState(() {
      
    });
  }

  Future<Null> _fechData() async{
    _isLoading = true;
    setState(() {
      // Dibujar
    });

    final duration = new Duration(seconds: 2);
    return new Timer(
        duration,
        respuestaHTTP
    );
  }

  void respuestaHTTP() {
    _isLoading = false;
    _agregar10();
    _scrollController.animateTo(
      _scrollController.position.pixels+120, 
      duration: Duration(milliseconds: 250), 
      curve: Curves.fastOutSlowIn
    );
  }

 Widget _crearLoading() {
   if(_isLoading){
     return Column(
       mainAxisSize: MainAxisSize.max,
       mainAxisAlignment: MainAxisAlignment.end,
       children: <Widget>[
         Row(
           mainAxisAlignment: MainAxisAlignment.center,
           children: <Widget>[
             CircularProgressIndicator(

             )
           ],
         ),
         SizedBox(height: 15.0,)
       ],
     );
   }else{
     return Container();
   }
 }
}