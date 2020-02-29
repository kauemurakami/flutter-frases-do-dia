import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Frase do dia',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var _frases = [
    "Não importa a cor do céu. Quem faz o dia bonito é você.",
    "Enquanto o dia semeia sonhos, a noite rega a esperança.",
    "Quanto mais agradecemos, mais coisas boas acontecem.",
    "Não coloque limites em seus sonhos, coloque fé.",
    "A vida me ensinou que chorar alivia, mas sorrir torna tudo mais bonito.",
    "As melhores coisas da vida não são coisas."
  ];

  var _fraseGerada = "Clique abaixo para gerar uma frase";

  void _gerarFrase(){

    var n = Random().nextInt(_frases.length);

    setState(() {
      _fraseGerada = _frases[n];
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.lightGreen,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16),
          //largura definida como 100% do espaço disponível
          width: double.infinity,
          decoration: BoxDecoration(
              border: Border.all(width: 3, color: Colors.amber)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset("images/logo.png"),
              Text(
                _fraseGerada,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 17,
                  fontStyle: FontStyle.italic,
                  color: Colors.black,
                ),
              ),
              RaisedButton(
                child: Text(
                  "Nova Frase",
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                  ),
                ),
                color: Colors.lightGreen,
                onPressed: _gerarFrase,
              )
            ],
          ),
        ),
      )
    );
  }
}
