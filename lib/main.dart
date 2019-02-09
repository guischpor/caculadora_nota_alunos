import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Calculadora Média',
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController nota1Controller = TextEditingController();
  TextEditingController nota2Controller = TextEditingController();
  TextEditingController nota3Controller = TextEditingController();
  TextEditingController nota4Controller = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _infoText = 'Informe as notas!';

  void _resetFields() {
    nota1Controller.text = '';
    nota2Controller.text = '';
    nota3Controller.text = '';
    nota4Controller.text = '';
    setState(() {
      _infoText = 'Informe as notas!';
    });
  }

  void _calculate() {
    setState(() {
      double nota1 = double.parse(nota1Controller.text);
      double nota2 = double.parse(nota2Controller.text);
      double nota3 = double.parse(nota3Controller.text);
      double nota4 = double.parse(nota4Controller.text);
      double result = (nota1 + nota2 + nota3 + nota4) / 4;

      if (result >= 70.0) {
        _infoText = 'Aprovado!, Sua nota é ${result.toStringAsPrecision(3)}';
      } else {
        _infoText = 'Reprovado!, Sua nota é ${result.toStringAsPrecision(3)}';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora de Média Nota Alunos'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _resetFields,
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Icon(
                Icons.format_list_numbered,
                size: 120.0,
                color: Colors.deepPurple,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: 'Nota 1',
                    labelStyle: TextStyle(color: Colors.deepPurple)),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.deepPurple, fontSize: 25.0),
                controller: nota1Controller,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Insira a nota 1';
                  }
                },
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: 'Nota 2',
                    labelStyle: TextStyle(color: Colors.deepPurple)),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.deepPurple, fontSize: 25.0),
                controller: nota2Controller,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Insira a nota 2';
                  }
                },
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: 'Nota 3',
                    labelStyle: TextStyle(color: Colors.deepPurple)),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.deepPurple, fontSize: 25.0),
                controller: nota3Controller,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Insira a nota 3';
                  }
                },
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: 'Nota 4',
                    labelStyle: TextStyle(color: Colors.deepPurple)),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.deepPurple, fontSize: 25.0),
                controller: nota4Controller,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Insira a nota 4';
                  }
                },
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Container(
                  height: 50.0,
                  child: RaisedButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        _calculate();
                      }
                    },
                    child: Text(
                      'Calcular',
                      style: TextStyle(fontSize: 25.0, color: Colors.white),
                    ),
                    color: Colors.deepPurple,
                  ),
                ),
              ),
              Text(
                _infoText,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.deepPurple, fontSize: 25.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}
