import 'package:argh/models/GameCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:argh/view/rules.dart';

class RulePage extends StatefulWidget {
  const RulePage({super.key});

  @override
  State<RulePage> createState() => _RulePage();
}

class _RulePage extends State<RulePage> {
  final String SECURE_KEY = 'AHOY_RULE_LIST';
  String _loadedSecureText = "";

  late List<GameCard> cardList = [];

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text('Regole di gioco',style: TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.pink),
              onPressed: () => showWin(),
              child: Text('Come Vincere',style: TextStyle(fontSize: 30, color: Colors.white),),
            ),
            TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.pink),
              onPressed: () => showMap(),
              child: Text('Campo da Gioco',style: TextStyle(fontSize: 30, color: Colors.white),),
            ),
            TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.pink),
              onPressed: () => showMovements(),
              child: Text('Come Muoversi',style: TextStyle(fontSize: 30, color: Colors.white),),
            ),
            TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.pink),
              onPressed: () => showAttack(),
              child: Text('Attaccare avversari',style: TextStyle(fontSize: 30, color: Colors.white),),
            ),
            TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.pink),
              onPressed: () => showPoints(),
              child: Text('Ricevere Bottino',style: TextStyle(fontSize: 30, color: Colors.white),),
            ),
            TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.pink),
              onPressed: () => showEnd(),
              child: Text('Fine del gioco',style: TextStyle(fontSize: 30, color: Colors.white),),
            ),
          ],
        ),
      ),
    );
  }

  showWin() {
    print('Win');
    rules().showWin(context);
  }

  showPoints(){
    print('Points');
    rules().showPoints(context);
  }

  showAttack(){
    print('Attack');
    rules().showAttack(context);
  }

  showMovements() {
    print('Movement');
    rules().showMovements(context);
  }

  void showMap() {
    print('Map');
    rules().showMap(context);
  }

  void showEnd() {
    print('End');
    rules().showEnd(context);
  }
}


