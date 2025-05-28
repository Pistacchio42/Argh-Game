import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../controllers/NewCardController.dart';
import 'package:argh/models/GameCard.dart';

class NewCardPage extends StatefulWidget {
  final NewCardController controller;

  const NewCardPage({
    super.key,
    required this.controller
  });

  @override
  State<NewCardPage> createState() => _NewCardPage(controller);
}

class _NewCardPage extends State<NewCardPage> {

  late NewCardController controller;


  _NewCardPage(this.controller);

  String? _title;
  String? _content;
  int _quantity=1;
  String? _type;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('Aggiungi una carta al gioco'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          titleWidget(),
          contentWidget(),
          typeWidget(),
          quantityWidget(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: confirm(), child: Icon(Icons.check),),
    );
  }

  titleWidget() {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Metti qui il titolo della carta',
      ),
    );
  }

  contentWidget() {
    return TextField(
      maxLines: 8,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Metti qui il Contenuto della carta',
      ),
    );
  }

  typeWidget(){
    return SizedBox(
      height: 100, // Fixed height for the carousel
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: GameCard.allTypes.length,
        itemBuilder: (context, index) {
          final cardType = GameCard.allTypes[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  iconSize: 40,
                  icon: Icon(
                    GameCard.typeIcons[cardType] ?? Icons.credit_card,
                    color: Theme.of(context).primaryColor,
                  ),
                  onPressed: () => onCardSelected(cardType),
                ),
                Text(
                  cardType,
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void onCardSelected(String cardType) {
    //TODO update card type
  }

  quantityWidget() {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Decrement button
          IconButton(
            icon: const Icon(Icons.remove),
            onPressed: () {
              if (_quantity > 0) {
                setState(() {
                  _quantity--;
                });
              }
            },
            style: IconButton.styleFrom(
              backgroundColor: _quantity == 0 ? Colors.grey[300] : Theme.of(context).primaryColor,
              foregroundColor: _quantity == 0 ? Colors.grey : Colors.white,
            ),
          ),

          // Number display
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              '$_quantity',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),

          // Increment button
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              setState(() {
                _quantity=_quantity+1;
              });
            },
            style: IconButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor,
              foregroundColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  confirm() {
    print('confirmed');
  }

  
}
