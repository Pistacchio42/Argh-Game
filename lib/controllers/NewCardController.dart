import 'package:argh/models/GameCard.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class NewCardController{


  NewCardController(){

  }

  final storage = const FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
  );

  final String SECURE_KEY = 'SECURE_KEY_FOR_AHOY_CARD';
  String _loadedSecureText="";

  Future<void> create(String title, String content, String type, int quantity) async {
    GameCard newCard;
      switch (type){
        case 'Tesoro':
          newCard = GameCard.loot(title, content, quantity);
          break;

        case 'Movimento':
          newCard = GameCard.move(title, content, quantity);
          break;

        case 'Battaglia':
          newCard = GameCard.battle(title, content, quantity);
          break;

        case 'Effetto':
          newCard = GameCard.effect(title, content, quantity);
          break;

        case 'Isola':
          newCard = GameCard.island(title, content, quantity);
          break;

        default:
          newCard=GameCard(title, content, quantity, type);
      }
      print(newCard.content);
      await storage.write(key: SECURE_KEY, value: newCard.encode());
  }

  readAll() async {
    String value = await storage.read(key:SECURE_KEY)??'';
    print('loaded $value');
    GameCard.decode(value).type;

  }

}