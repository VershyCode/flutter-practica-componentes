import 'package:flutter/services.dart' show rootBundle; // Traemos los servicios para leer un json.

class _MenuProvider{
  List<dynamic> opciones = [];
  
  _MenuProvider(){
    cargarData();
  }

  cargarData() {
    rootBundle.loadString('data/menu_opts.json').then((data) => print(data));
  }
}

final menuProvider = new _MenuProvider();