import 'package:argh/resources/flutter-icons-21a1aafc/my_flutter_app_icons.dart';
import 'package:flutter/material.dart';

import 'controllers/NewCardController.dart';
import 'view/NewCardPage.dart';
import 'controllers/ListCardController.dart';
import 'view/ListCardPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aohy Boy',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown),
      ),
      home: const MyHomePage(title: 'Ahoy Boi'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String changingText = '';

  void _incrementCounter() {
    print('c');
    setState(() {
      changingText = "vai Disa";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        leading: Icon(Icons.anchor),
        actions: <Widget>[getDropdown(),],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('mostra lista di scansioni');
          _incrementCounter(); //va alla pagina di scansioni
        },
        tooltip: 'regole',
        child: const Icon(Icons.question_mark),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
              iconSize: 100.0,
              onPressed: gotoDice,
              //setTwo esegue un navigator Push con argomento 2 per cambiare scena
              icon: const Icon(MyFlutterApp.perspective_dice_random),
              tooltip: 'vai alla schermata di lancio dadi',
            ),
            IconButton(
              iconSize: 100.0,
              onPressed: gotoCard,
              //setTwo esegue un navigator Push con argomento 3 per cambiare scena
              icon: const Icon(MyFlutterApp.spades_card),
              tooltip: 'estrai una carta',
            ),
          ],
        ),
      ),
    );
  }

  getDropdown() {
    return PopupMenuButton<String>(
      popUpAnimationStyle: AnimationStyle(
        curve: Easing.emphasizedDecelerate,
        duration: Duration(seconds: 3),
      ),
      icon: const Icon(Icons.more_vert), // Three dots vertical icon
      tooltip: 'Apri opzioni',
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        const PopupMenuItem<String>(
          value: 'add_card',
          child: ListTile(
            leading: Icon(Icons.add, color: Colors.green),
            title: Text('Aggiungi Carta'),
          ),
        ),
        const PopupMenuItem<String>(
          value: 'show_cards',
          child: ListTile(
            leading: Icon(Icons.list_alt, color: Colors.orange),
            title: Text('Sfoglia Carte'),
          ),
        ),
      ],
      onSelected: (String value) {
        switch (value) {
          case 'add_card':
            gotoCardOptions();
            break;
          case 'show_cards':
            gotoCardList();
            break;
        }
      },
    );
  }

  gotoCardOptions() {
    print('goto Card Option');
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NewCardPage(controller: NewCardController()),
      ),
    );
  }

  restore(){
    print('restore');
  }

  gotoDice() {
    print('goto Dice');
  }

  gotoCard() {
    print('goto Card');
  }

  gotoCardList() {
    print('goto Card List');
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ListCardPage(controller: ListCardController()),
      ),
    );
  }
}
