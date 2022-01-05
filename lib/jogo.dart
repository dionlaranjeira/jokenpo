import 'package:flutter/material.dart';
import 'dart:math';

class Jogo extends StatefulWidget {
  const Jogo({Key? key}) : super(key: key);

  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {

  var _imagemApp = AssetImage("imagens/padrao.png");
  var _memsagem = "Escolha uma opção abaixo";

  void _opcaoSelecionada(String escolhaUsuario){
      var opcoes = ["pedra", "papel", "tesoura"];
      var sorteio = Random().nextInt(opcoes.length);
      var escolhaApp = opcoes[sorteio];

      switch(escolhaApp){
        case "pedra":
          setState(() {
            _imagemApp = AssetImage("imagens/pedra.png");
          });
          break;
        case "papel":
          setState(() {
            _imagemApp = AssetImage("imagens/papel.png");
          });
          break;
        case "tesoura":
          setState(() {
            _imagemApp = AssetImage("imagens/tesoura.png");
          });
          break;
      }


      if((escolhaUsuario == "pedra" && escolhaApp =="tesoura") ||
          (escolhaUsuario == "tesoura" && escolhaApp =="papel") ||
          (escolhaUsuario == "papel" && escolhaApp =="pedra")){
        setState(() {
          _memsagem = "Você ganhou, parabéns!";
        });
      }else if((escolhaApp == "pedra" && escolhaUsuario =="tesoura") ||
          (escolhaApp == "tesoura" && escolhaUsuario =="papel") ||
          (escolhaApp == "papel" && escolhaUsuario =="pedra")){
        setState(() {
          _memsagem = "Você perdeu, não desista!";
        });
      }else{
        setState(() {
          _memsagem = "Empate!";
        });
      }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jokenpo"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          //text
          //imagem
          //linha 3 imagens
          Padding(
            padding: EdgeInsets.only(top:32,bottom: 16),
            child: Text(
              "Escolha do App",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Image(image: this._imagemApp,height: 100),
          Padding(
            padding: EdgeInsets.only(top:32,bottom: 16),
            child: Text(
              _memsagem,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: ()=> _opcaoSelecionada("pedra"),
                child: Image.asset("imagens/pedra.png", height: 100),
              ),
              GestureDetector(
                onTap: ()=> _opcaoSelecionada("papel"),
                child: Image.asset("imagens/papel.png", height: 100),
              ),
              GestureDetector(
                onTap: ()=> _opcaoSelecionada("tesoura"),
                child: Image.asset("imagens/tesoura.png", height: 100),
              ),
            ],
          )
        ],
      ),
    );
  }
}
