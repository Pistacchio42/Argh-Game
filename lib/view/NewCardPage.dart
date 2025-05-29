import 'package:argh/models/GameCard.dart';
import 'package:flutter/material.dart';
import 'package:infinite_carousel/infinite_carousel.dart';

import '../controllers/NewCardController.dart';

class NewCardPage extends StatefulWidget {
  final NewCardController controller;

  const NewCardPage({super.key, required this.controller});

  @override
  State<NewCardPage> createState() => _NewCardPage(controller);
}

class _NewCardPage extends State<NewCardPage> {
  late NewCardController controller;

  _NewCardPage(this.controller);

  String? _title = '';
  String? _content = '';
  int _quantity = 1;
  String? _type = 'Tesoro';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('Aggiungi una carta al gioco'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            titleWidget(),
            contentWidget(),
            typeWidget(),
            quantityWidget(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createCard(),
        child: Icon(Icons.check),
      ),
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

  InfiniteScrollController scrontroll = InfiniteScrollController();

  typeWidget() {
    return SizedBox(
      height: 150, // Fixed height for the carousel
      child: InfiniteCarousel.builder(
        itemCount: GameCard.allTypes.length,
        itemExtent: 120,
        center: true,
        anchor: 0.0,
        velocityFactor: 0.1,
        onIndexChanged: (index) {
          //onCardSelected(GameCard.allTypes[index]);
        },
        controller: scrontroll,
        axisDirection: Axis.horizontal,
        loop: true,
        itemBuilder: (context, itemIndex, realIndex) {
          final cardType = GameCard.allTypes[itemIndex];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: AnimatedSize(
                    duration: Duration(milliseconds: 200),
                    curve: Curves.easeOut,
                    child: Icon(
                      GameCard.typeIcons[cardType] ?? Icons.question_mark,
                      color: (_type == cardType)
                          ? GameCard.colorIcons[cardType]
                          : Colors.blueGrey,
                      size: (_type == cardType) ? 70 : 50,
                    ),
                  ),
                  onPressed: () => {
                    onCardSelected(cardType),
                    scrontroll.animateToItem(itemIndex),
                  },
                ),
                Text(cardType, style: const TextStyle(fontSize: 12)),
              ],
            ),
          );
        },
      ),
    );
  }

  void onCardSelected(String cardType) {
    setState(() {
      _type = cardType;
    });
    print(_type);
  }

  quantityWidget() {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Decrement button
          IconButton(
            icon: const Icon(Icons.remove),
            onPressed: () {
              if (_quantity > 1) {
                setState(() {
                  _quantity--;
                });
              }
            },
            style: IconButton.styleFrom(
              backgroundColor: _quantity == 1
                  ? Colors.grey[300]
                  : Theme.of(context).primaryColor,
              foregroundColor: _quantity == 1 ? Colors.grey : Colors.white,
            ),
          ),

          // Number display
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              '$_quantity',
              style: const TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
          ),

          // Increment button
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              setState(() {
                _quantity = _quantity + 1;
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

  createCard() {
    controller.create(_title!, _content!, _type!, _quantity);
  }
}
