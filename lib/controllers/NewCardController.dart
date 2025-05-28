import 'package:argh/models/GameCard.dart';

class NewCardController{

  NewCardController(){

  }

  void create(String title, String content, String type, int quantity) {
      GameCard newCard = GameCard.constructor[type]!(title, content, quantity);
      print(newCard.content);
      //TODO aggiungi il salvataggio su File

  }
}