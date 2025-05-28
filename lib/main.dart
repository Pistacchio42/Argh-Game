import 'package:flutter/material.dart';
import 'package:dice_icons/dice_icons.dart';
import 'package:argh/resources/flutter-icons-21a1aafc/my_flutter_app_icons.dart';

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
      home: const MyHomePage(title: 'AHOY'),
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
      changingText="vai Disa";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        leading: Icon(Icons.anchor),
        actions: <Widget>[
          IconButton(
            onPressed: gotoOptions,  //setTwo esegue un navigator Push con argomento 2 per cambiare scena
            icon: const Icon(Icons.settings),
            tooltip: 'vai alle opzioni?',
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('mostra lista di scansioni');
          _incrementCounter(); //va alla pagina di scansioni
        },
        tooltip: 'regole',
        child: const Icon(Icons.rule),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
              iconSize: 80.0,
              onPressed: gotoDice,  //setTwo esegue un navigator Push con argomento 2 per cambiare scena
              icon: const Icon(DiceIcons.dice5),
              tooltip: 'vai alla schermata di lancio dadi',
            ),
            IconButton(
              iconSize: 100.0,
              onPressed: gotoCard,//setTwo esegue un navigator Push con argomento 3 per cambiare scena
              icon: const Icon(MyFlutterApp.spades_card),
              tooltip: 'estrai una carta',
            ),
          ],
        ),
      ),
    );
  }

  gotoOptions() {
    print('goto option');
  }

  gotoDice() {
    print('goto Dice');
  }

  gotoCard(){
    print('goto Card');
  }

}