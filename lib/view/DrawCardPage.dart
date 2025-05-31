import 'dart:math';

import 'package:argh/models/GameCard.dart';
import 'package:flutter/material.dart';
import '../controllers/DrawCardController.dart';

class DrawCardPage extends StatefulWidget {
  final DrawCardController controller;

  const DrawCardPage({super.key, required this.controller});

  @override
  State<DrawCardPage> createState() => _DrawCardPage(controller);
}

class _DrawCardPage extends State<DrawCardPage> {
  late DrawCardController controller;

  _DrawCardPage(this.controller);

  late List<GameCard> cardList = [];

  late GameCard extractedCard ;

  int toDraw = 0;

  @override
  initState() {
    super.initState();
    controller.readAll().then(
      (value) => {
        setState(() {
          cardList = value;
          toDraw = allCards();
        }),
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          'Hai ancora ${toDraw} carte da pescare',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Icon(GameCard.typeIcons[extractedCard.type]?? Icons.question_mark),
              Text(extractedCard.type ?? 'estrai una carta'),
            ],
          ),
          Text(extractedCard.content ?? ''),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: draw()),
    );
  }

  draw(){
    var intValue = Random().nextInt(cardList.length);
    //ogni volta che estrai una carta togli una quantità
    //quando hai una carta che arriva a 0 rimuovila da CardList
    //se cardlist è a 0 Navigator.pop;
    //aggiorna anche $toDraw

  }

  int allCards() {
    int total = 0;
    for (GameCard gc in cardList) {
      total += gc.quantity;
    }
    return total;
  }
}
