import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  SliderPage({Key key}) : super(key: key);

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valorSlider = 100.0;
  bool _bloquearCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: <Widget>[
            _crearSlider(),
            _crearCheckbox(),
            _crearSwitch(),
            Expanded(
              child:_crearImagen(),
            ),
          ],
        )
      ),
    );
  }

  Widget _crearSlider() {
    return Slider(
      activeColor: Colors.indigoAccent,
      label: 'Tamaño de la imagen',
      // divisions: 20,
      value: _valorSlider,
      min: 10,
      max: 400,
      onChanged: (_bloquearCheck) ? null : (e){
        setState(() {
          _valorSlider = e;
        });
      }
    );
  }

 Widget _crearImagen() {
   return Image(
     image: NetworkImage('https://www.aniplaymexico.com/wp-content/uploads/2018/12/figura-coleccionable-thanos-infinity-war-1@2x-1100x1208.jpg'),
     width: _valorSlider,
     fit: BoxFit.contain,
   );
 }

  Widget _crearCheckbox() {
    // return Checkbox(
    //   value: _bloquearCheck,
    //   onChanged: (e){
    //     setState(() {
    //       _bloquearCheck = e;
    //     });
    //   },
    // );
    return CheckboxListTile(
      title: Text('Bloquear imagen'),
      value: _bloquearCheck,
      onChanged: (e){
        setState(() {
          _bloquearCheck = e;
        });
      },
    );
  }

 Widget _crearSwitch() {
   return SwitchListTile(
      title: Text('Bloquear imagen'),
      value: _bloquearCheck,
      onChanged: (e){
        setState(() {
          _bloquearCheck = e;
        });
      },
   );
 }
}