import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  InputPage({Key key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _nombre = '';
  String _email = '';
  String _password = '';
  String _fecha = '';
  String _opcionSeleccionada = 'Volar';
  TextEditingController _inputFieldDateController = new TextEditingController();
  List<String> _poderes = ['Volar', 'Rayos X', 'Super aliento','Super fuerza'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input page')
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _crearInput(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearFecha(context),
          Divider(),
          _crearDropdown(context),
          Divider(),
          _crearPersona()
        ],
      ),
    );
  }

  Widget _crearInput() {
    return TextField(
      maxLength: 15,
      autofocus: false,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        counter: Text('Letras: ${_nombre.length}/15'),
        hintText: 'Nombre de la persona',
        labelText: 'Nombre:',
        helperText: 'Solo es el nombre',
        suffixIcon: Icon(Icons.accessibility),
        icon: Icon(Icons.account_circle)
      ),
      onChanged: (value){
        setState(() {
        _nombre = value.toUpperCase();
        });
      },
    );
  }

 Widget _crearPersona() {
   return ListTile(
     title: Text('Nombre: $_nombre'),
     subtitle: Text('E-mail: $_email'),
   );
 }

  Widget _crearEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      maxLength: 35,
      autofocus: false,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'example@example.com',
        labelText: 'Correo electronico:',
        suffixIcon: Icon(Icons.alternate_email),
        icon: Icon(Icons.email)
      ),
      onChanged: (value){
        setState(() {
          _email = value.toLowerCase();
        });
      }
    );
  }
 Widget _crearPassword() {
   return TextField(
      obscureText: true,
      maxLength: 35,
      autofocus: false,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: '',
        labelText: 'Contraseña:',
        suffixIcon: Icon(Icons.lock_open),
        icon: Icon(Icons.lock)
      ),
      onChanged: (value){
        setState(() {
          _password = value;
        });
      }
    );
 }

  Widget _crearFecha(BuildContext context) {
    return TextField(
      controller: _inputFieldDateController,
      enableInteractiveSelection: false,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Fecha de nacimiento',
        labelText: 'Fecha de nacimiento:',
        suffixIcon: Icon(Icons.perm_contact_calendar),
        icon: Icon(Icons.calendar_today)
      ),
      onTap: (){
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }

  void _selectDate(BuildContext context) async{
    DateTime picked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(2018),
      lastDate: new DateTime(2025),
      locale: Locale('es', 'ES')
    );
    if(picked !=null){
      setState(() {
        _fecha = picked.toString();
        _inputFieldDateController.text = _fecha;
      });
    }
  }

  List<DropdownMenuItem<String>> getOpcionesDropDown(){
    List<DropdownMenuItem<String>> lista = new List();
    _poderes.forEach((e) {
      lista.add(DropdownMenuItem(
        child: Text(e),
        value: e,
      ));
     });
     return lista;
  }

  Widget _crearDropdown(BuildContext context) {
    return DropdownButton(
      value: _opcionSeleccionada,
      items: getOpcionesDropDown(),
      onChanged: (e){
        setState(() {
          _opcionSeleccionada = e;
        });
      },
    );
  }
}