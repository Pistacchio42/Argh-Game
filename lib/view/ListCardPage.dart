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

  late List<GameCard> cardList=[];

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
        title: Text('Ecco le carte',style: TextStyle(color: Colors.white,),),
      ),
      body: ListView.builder(
        itemCount: cardList!.length,
        itemBuilder: (BuildContext context, int index) {
          return cardTile(index);
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: ()=>
      {
        confirmChanges(),
      }, child: Icon(Icons.check)),
    );
  }

  cardTile(int index) {
    GameCard card = cardList[index];
    return Padding(
      padding: EdgeInsets.all(4),
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        leading: Icon(GameCard.typeIcons[card.type] ?? Icons.question_mark,size: 30,color: invert(GameCard.colorIcons[card.type]!),),
        tileColor: GameCard.colorIcons[card.type] ?? Colors.black,
        title: Text('${card.name}',style:TextStyle(color: invert(GameCard.colorIcons[card.type]!), fontSize: 30)),
        subtitle: Text('${card.content}',style:TextStyle(color: invert(GameCard.colorIcons[card.type]!))),
        trailing: IconButton(onPressed: ()=>{
          cardList.removeAt(index),
          setState(() {
            cardList;
          })
        }, icon: Icon(Icons.delete, color: Colors.red)),
      ),
    );
  }

  confirmChanges() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Ho modificato le carte"),
        content: const Text("Ho reso permanenti le modifiche che hai fatto in questa schermata"),
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

}

Color invert(Color color) {
  final r = 255 - color.red;
  final g = 255 - color.green;
  final b = 255 - color.blue;
  return Color.fromARGB((color.opacity * 255).round(), r, g, b);
}


