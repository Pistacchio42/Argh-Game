import 'package:argh/models/GameCard.dart';
import 'package:flutter/material.dart';

class RulePage extends StatefulWidget {

  const RulePage({super.key});

  @override
  State<RulePage> createState() => _RulePage();
}

class _RulePage extends State<RulePage> {

  late List<GameCard> cardList = [];

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text('Regole di gioco'),
      ),
    );
  }
}