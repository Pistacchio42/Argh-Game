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

  late GameCard extractedCard = GameCard(
    'estarai la prima carta',
    'clicca il pulsante li sotto',
    0,
    'Instruction',
  );

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
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  decoration: iconDecoration(
                    GameCard.colorIcons[extractedCard.type] ?? Colors.grey,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Icon(
                      GameCard.typeIcons[extractedCard.type] ??
                          Icons.question_mark,
                      size: 55,
                      color:
                          GameCard.colorIcons[extractedCard.type] ??
                          Colors.black45,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Container(
                    width: 270,
                    child: Text(
                      extractedCard.name ?? 'estrai una carta',
                      style: TextStyle(fontSize: 33),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(padding: EdgeInsets.all(15), child: Container(
            child: Text(
              extractedCard.content ?? '',
              maxLines: 8,
              style: TextStyle(fontSize: 20),
            ),
            decoration: contentDecoration(
              GameCard.colorIcons[extractedCard.type] ?? Colors.grey,
            ),
          ),)
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => draw(),
        child: Icon(Icons.draw),
      ),
    );
  }

  draw() {
    if (toDraw < 1) Navigator.pop(context);
    var intValue = Random().nextInt(cardList.length);
    //ogni volta che estrai una carta togli una quantità
    cardList[intValue].quantity--;
    setState(() {
      toDraw--;
      extractedCard = cardList[intValue];
    });
    //quando hai una carta che arriva a 0 rimuovila da CardList
    if (cardList[intValue].quantity < 1) cardList.removeAt(intValue);
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

  BoxDecoration iconDecoration(Color col) {
    return BoxDecoration(
      color: invert(col),
      border: Border.all(width: 4, color: col),
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(color: Colors.black38, blurRadius: 3, offset: Offset(2, 5)),
      ],
    );
  }

  BoxDecoration contentDecoration(Color col) {
    return BoxDecoration(
      border: Border.all(color: col, width: 4), //Border.all
      borderRadius: BorderRadius.vertical(),
    );
  }
}

Color invert(Color color) {
  final r = 255 - color.red;
  final g = 255 - color.green;
  final b = 255 - color.blue;
  return Color.fromARGB((color.opacity * 255).round(), r, g, b);
}
