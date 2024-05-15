import 'package:flutter/material.dart';

void main (){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Calculadora IMC',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home:CalculadoraIMCPage(),
    );
  }
}

class CalculadoraIMC{
  double calcularIMC(double peso, double altura){
    return peso/(altura*altura);
  }
}

class CalculadoraIMCPage extends StatefulWidget{
  _CalculadoraIMCPageState createState()=>
  _CalculadoraIMCPageState();
}

class _CalculadoraIMCPageState extends State<CalculadoraIMCPage>{
  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();
  double resultadoIMC = 0.0;

  void calcularIMC(){
    double peso = double.tryParse(pesoController.text)?? 0.0;
    double altura = double.tryParse(alturaController.text)?? 0.0;

    setState((){
      resultadoIMC = CalculadoraIMC().calcularIMC(peso,altura);
    });
    }

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("CalcularIMC"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: pesoController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Peso(kg)'),
            ),
            TextField(
              controller: alturaController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Altura(m)'),
            ),
            ElevatedButton(
              onPressed: calcularIMC,
              child: Text('Calcular IMC'),
            ),
            Text('Seu IMC é: ${resultadoIMC.toStringAsFixed(2)}'),
          ],
        ),
      ),
    );
  }
}