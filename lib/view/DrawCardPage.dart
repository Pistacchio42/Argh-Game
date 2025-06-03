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
  _DrawCardPage(this.controller);

  bool endgame=false;
  late int all=0;
  late DrawCardController controller;
  late List<GameCard> cardList = [];
  List <GameCard> drawnCardList=[];
  late GameCard extractedCard = GameCard(
    'estarai la prima carta',
    'clicca il pulsante li sotto',
    0,
    'Instruction',
  );

  int toDraw = 0;
  bool cardAck = false;

  @override
  initState() {
    super.initState();
    controller.readAll().then(
      (value) => {
        setState(() {
          cardList = value;
          toDraw = allCards();
          all=(cardList.length/2).truncate();
        }),
      },
    );
  }


  @override
  void dispose() {
    super.dispose();
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
                      extractedCard.name,
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
              extractedCard.content,
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
        onPressed: () => {setState(() {
          draw();
        })},
        child: Icon(Icons.draw),
      ),
    );
  }

  GameCard draw() {
    if(cardAck && toDraw>0){
      extractedCard=GameCard("pesca", 'clicca sotto per pescare una carta', 1, "Test");
      cardAck=!cardAck;
      return extractedCard;
    }
    if (toDraw < 1) {
      Navigator.pop(context);
      return GameCard("pesca", 'clicca sotto per pescare una carta', 1, "Test");
    }

    print('$toDraw in $all');

    if(!endgame && (toDraw<(all))){//estrai fine gioco
      GameCard endgameCard= GameCard.allConstruction['Endgame']!(
        'Risorse Scarse',
        "da questo momento in poi, ogni volta che un giocatore attracca ad un porto, viene girata une cella dell\'isola, ripesca una carta",
        1,
      );
      extractedCard=endgameCard;
      drawnCardList.add(extractedCard);
      cardAck=!cardAck;
      endgame=true;
      return extractedCard;
    }

    var intValue = Random().nextInt(cardList.length);
    //ogni volta che estrai una carta togli una quantità
    cardList[intValue].quantity--;
    setState(() {
      toDraw--;
    });
    extractedCard = cardList[intValue];
    drawnCardList.add(extractedCard);
    if (cardList[intValue].quantity < 1) cardList.removeAt(intValue);
    cardAck=!cardAck;
    return extractedCard;
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
