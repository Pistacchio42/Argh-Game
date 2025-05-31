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
        actions: <Widget>[getDropdown(), info()],
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
          onLongPress: () => {
            longPressCallback(card, index),
            setState(() {
              cardList;
            }),
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          leading: Expanded(
            child: Icon(
              GameCard.typeIcons[card.type] ?? Icons.question_mark,
              size: 30,
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
    int numerocarte = 0;
    final Map<String, int> count = Map();

    for (GameCard g in cardList) {
      numerocarte += g.quantity;
      if (!count.keys.contains(g.type))
        count[g.type] = g.quantity;
      else
        count[g.type] = count[g.type]! + g.quantity;
    }
    return IconButton(
      onPressed: () => infoPressed(numerocarte, count),
      icon: Icon(Icons.question_mark),
    );
  }

  infoPressed(int numerocarte, Map<String, int> count) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(
          "Informazioni su tutte le $numerocarte carte",
          style: TextStyle(fontSize: 25),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        content: setUpAlertDialog(count),
        actions: <Widget>[
          TextButton(
            onPressed: () => {Navigator.of(ctx).pop()},
            child: const Text("Capito"),
          ),
        ],
      ),
    );
  }

  Future<void> longPressCallback(GameCard cardToModify, index) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        int quantity = cardToModify.quantity;
        TextEditingController contTitle = TextEditingController();
        TextEditingController contContent = TextEditingController();
        contContent.text = cardToModify.content;
        contTitle.text = cardToModify.name;
        return Expanded(
          child: Container(
            height: 200,
            child: AlertDialog(
              title: Text('Modifica carta'),
              content: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  TextField(controller: contTitle),
                  TextField(controller: contContent, maxLines: 8),
                  Row(
                    children: <Widget>[
                      IconButton(
                        onPressed: () => {
                          cardToModify.quantity--,
                          if (cardToModify.quantity <= 0)
                            {
                              cardList.removeAt(index),
                              Navigator.of(context).pop,
                            },
                          setState(() {
                            quantity--;
                          }),
                        },
                        icon: Icon(Icons.remove),
                      ),
                      Text(quantity as String),
                      IconButton(
                        onPressed: () => {
                          cardToModify.quantity++,
                          setState(() {
                            quantity++;
                          }),
                        },
                        icon: Icon(Icons.add),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () => {
                      setState(() {
                        cardToModify.name = contTitle.text;
                        cardToModify.content = contContent.text;
                      }),
                      controller.saveChanges(cardList),
                      Navigator.of(context).pop(),
                    },
                    child: Text('Conferma'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

Widget setUpAlertDialog(Map<String, int> count) {
  return Container(
    height: 100.0, // Change as per your requirement
    width: 300.0, // Change as per your requirement
    child: ListView.builder(
      shrinkWrap: true,
      itemCount: count.keys.length,
      itemBuilder: (BuildContext context, int index) {
        print('tipo: ${count.keys.toList()[index]}');
        return Text(
          'Ci sono ${count[count.keys.toList()[index]]} carte di tipo ${count.keys.toList()[index]}',
          style: TextStyle(fontSize: 15),
        );
      },
    ),
  );
}

Color invert(Color color) {
  final r = 255 - color.red;
  final g = 255 - color.green;
  final b = 255 - color.blue;
  return Color.fromARGB((color.opacity * 255).round(), r, g, b);
}
