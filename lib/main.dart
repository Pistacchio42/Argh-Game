import 'package:flutter/material.dart';
import 'package:dice_icons/dice_icons.dart';
import 'package:iconify_flutter_plus/iconify_flutter_plus.dart'; // For Iconify Widget
import 'package:iconify_flutter_plus/icons/zondicons.dart'; // for Non Colorful
//import 'package:iconify_flutter/iconify_flutter.dart';
//import 'package:colorful_iconify_flutter/icons/twemoji.dart';

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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
    setState(() {
      changingText="vai Disa";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        leading: Icon(Icons.anchor),
        title: Text('Ahoy'),
        actions: <Widget>[
          TextButton(onPressed: (){gotoOptions;}, child: Icon(Icons.settings)),
        ],
      ),
      body: Center(
        child: Column(
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('$changingText', style: Theme.of(context).textTheme.headlineMedium,),
            TextButton(onPressed: gotoDice(), child: Icon(DiceIcons.dice3)),
            //TODO TextButton(onPressed: gotoCard(), child: Iconify(Twemoji.joker)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Suca',
        child: const Icon(Icons.blur_on),
      ), // This trailing comma makes auto-formatting nicer for build methods.
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