import 'package:argh/models/GameCard.dart';
import 'package:flutter/material.dart';
import '../controllers/ListCardController.dart';

class ListCardPage extends StatefulWidget {
  final ListCardController controller;

  const ListCardPage({super.key, required this.controller});

  @override
  State<ListCardPage> createState() => _ListCardPage(controller);
}

class _ListCardPage extends State<ListCardPage> {
  late ListCardController controller;

  _ListCardPage(this.controller);

  late List<GameCard> cardList = [];

  @override
  initState() {
    super.initState();
    controller.readAll().then(
      (value) => {
        setState(() {
          cardList = value;
        }),
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('Ecco le carte', style: TextStyle(color: Colors.white)),
        actions: <Widget>[getDropdown(), ],
      ),
      body: ListView.builder(
        itemCount: cardList!.length,
        itemBuilder: (BuildContext context, int index) {
          return cardTile(index);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {confirmChanges()},
        child: Icon(Icons.check),
      ),
    );
  }

  cardTile(int index) {
    GameCard card = cardList[index];
    return Padding(
      padding: EdgeInsets.all(6),
      child: Expanded(
        child: ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          leading: Expanded(
            child: Icon(
              GameCard.typeIcons[card.type] ?? Icons.question_mark,
              size: 40,
              color: invert(GameCard.colorIcons[card.type]!),
            ),
          ),
          tileColor: GameCard.colorIcons[card.type] ?? Colors.black,
          title: Text(
            '${card.name}',
            style: TextStyle(
              color: invert(GameCard.colorIcons[card.type]!),
              fontSize: 30,
            ),
          ),
          subtitle: Text(
            '${card.content}',
            style: TextStyle(
              color: invert(GameCard.colorIcons[card.type]!),
              fontSize: 20,
            ),
          ),
          trailing: Text(
            '${card.quantity}',
            style: TextStyle(
              color: invert(GameCard.colorIcons[card.type]!),
              fontSize: 25,
            ),
          ),
        ),
      ),
    );
  }

  confirmChanges() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Ho modificato le carte"),
        content: const Text(
          "Ho reso permanenti le modifiche che hai fatto in questa schermata",
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: const Text("..."),
          ),
        ],
      ),
    );
    controller.saveChanges(cardList);
  }

  getDropdown() {
    return IconButton(onPressed: () => importJson(), icon: Icon(Icons.add));
  }

  importJson() {
    TextEditingController t = TextEditingController();
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text(
          "Inserisci qui la lista di Json per l'import manuale",
        ),
        content: TextField(controller: t),
        actions: <Widget>[
          TextButton(
            onPressed: () => {
              controller.parse(t.text),
              setState(() {
                cardList;
              }),
              Navigator.of(ctx).pop(),
            },
            child: const Text("Importa"),
          ),
        ],
      ),
    );
    controller.saveChanges(cardList);
  }

  info() {

    int numerocarte= 0;
    final Map<String, int> count = Map();

    for (GameCard g in cardList){
      numerocarte+= g.quantity;
      if(!count.keys.contains(g.type)) count[g.type]=g.quantity;
      else count[g.type] = count[g.type]! + g.quantity;

    }

    return IconButton(
      onPressed: () => showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text(
            "Informazioni su tutte le carte",
          ),
          content: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: <Widget>[
            Text('Ci sono in totale $numerocarte carte'),
            ListView.builder(
              itemCount: GameCard.allTypes!.length,
              itemBuilder: (BuildContext context, int index) {
                return Text('Ci sono ${count[GameCard.allTypes[index]]} carte ${GameCard.allTypes[index]}');
              },
            ),

          ],),
        ),
      ),
      icon: Icon(Icons.question_mark),
    );
  }
}

Color invert(Color color) {
  final r = 255 - color.red;
  final g = 255 - color.green;
  final b = 255 - color.blue;
  return Color.fromARGB((color.opacity * 255).round(), r, g, b);
}
