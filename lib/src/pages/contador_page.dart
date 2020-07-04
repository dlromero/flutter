import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContadorPage extends StatefulWidget {
  @override
  createState() => _ContadorPageState();
}

class _ContadorPageState extends State<ContadorPage> {
  TextStyle _estiloTexto = new TextStyle(fontSize: 25);
  int _conteo = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Scaffold'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Text(
                'Número de taps:',
                style: _estiloTexto,
              ),
              Text(
                '$_conteo',
                key: Key('counter'),
                style: _estiloTexto,
              )
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ),
        floatingActionButton: _crearBotones());
  }

  Widget _crearBotones() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        SizedBox(width: 30.0),
        FloatingActionButton(
          key: Key('zero'),
          child: Icon(Icons.exposure_zero),
          onPressed: _reset,
        ),
        Expanded(child: SizedBox()),
        FloatingActionButton(
          key: Key('decrement'),
          child: Icon(Icons.remove),
          onPressed: _sustraer,
        ),
        SizedBox(width: 5.0),
        FloatingActionButton(
          key: Key('increment'),
          child: Icon(Icons.add),
          onPressed: _agregar,
        )
      ],
    );
  }

  void _agregar() {
    setState(() => _conteo++);
  }

  void _sustraer() {
    setState(() => _conteo--);
  }

  void _reset() {
    setState(() => _conteo = 0);
  }
}
