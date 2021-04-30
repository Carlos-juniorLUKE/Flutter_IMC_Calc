import 'dart:ffi';

import 'package:flutter/material.dart';
void main() {
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

   TextEditingController controladorDePeso = TextEditingController();
   TextEditingController controladorDeAltura = TextEditingController();

 // ignore: unused_field
 String _infoText = "Informe Seus Dados!";
   // ignore: unused_element
   void _resetfields() {
     controladorDePeso.text = "";
     controladorDeAltura.text = "";
     _infoText = "Informe seus dados!";
   }
   // ignore: unused_element
   void _calcular (){
   setState(() {
       // ignore: unused_local_variable
     double peso = double.parse(controladorDePeso.text);
     // ignore: unused_local_variable
     double altura = double.parse(controladorDeAltura.text) / 100;
     // ignore: unused_local_variable
     double imc = peso / (altura * altura);
     if(imc < 18.6){
       // ignore: unnecessary_brace_in_string_interps
       _infoText = "Abaixo do peso (${imc.toStringAsPrecision(4)})";
     } else if (imc >= 18.6 && imc < 24.9){
       _infoText = "Peso Ideal (${imc.toStringAsPrecision(4)})";
     } else if (imc >= 24.9 && imc < 29.9){
       _infoText = "Levemente acima do peso (${imc.toStringAsPrecision(4)})";
     }else if (imc >= 29.9 && imc < 34.9){
       _infoText = "Obesidade Grau I (${imc.toStringAsPrecision(4)})";
     }else if (imc >= 34.9 && imc < 39.9){
       _infoText = "Obesidade Grau II (${imc.toStringAsPrecision(4)})";
     }
     else if (imc >= 40){
       _infoText = "Obesidade Grau III (${imc.toStringAsPrecision(4)})";
     }
   });

   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora de IMC"),
        backgroundColor: Colors.cyan,
        centerTitle: true,
        actions: <Widget> [
          IconButton(icon: Icon(Icons.refresh), onPressed: _resetfields,
          )
        ],
      ),
    backgroundColor: Colors.white,
    body: SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
      child:  Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget> [
        Icon(Icons.person_outline, size: 70.0,color: Colors.cyan[700]),
        TextField(keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: "Peso (kg)",
          labelStyle: TextStyle(color: Colors.cyan[700])
        ),
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.cyan[700],),
        controller: controladorDePeso,
        ),
        TextField(keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: "Altura (cm)",
          labelStyle: TextStyle(color: Colors.cyan[700])
        ),
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.cyan[700],),
        controller: controladorDeAltura,
        ),
       Padding(
         padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
         child: Container(
          height: 50.0,
          // ignore: deprecated_member_use
          child: RaisedButton(
             padding: EdgeInsets.fromLTRB(60.0, 0.0, 60.0, 0.0),
            onPressed: _calcular,
          child: Text("Calcular",
          style:TextStyle(color: Colors.white,),),
          color: Colors.cyan[700],
        ),
        ) 
        ,),
        Text(
          _infoText,
          textAlign: TextAlign.center,
          style: TextStyle( color: Colors.cyan[700]),
        ),
      ],
    ),
      )
    
    );
  }
}