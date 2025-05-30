import 'dart:convert';

import 'package:argh/models/GameCard.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ListCardController {
  ListCardController() {}

  final storage = const FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
  );

  final String SECURE_KEY = 'SECURE_KEY_FOR_AHOY_CARD';
  String _loadedSecureText = "";

  Future<List<GameCard>> readAll() async {
    String value = await storage.read(key: SECURE_KEY) ?? '';
    print('loaded $value');
    List<dynamic> jsonList = jsonDecode(value);

    return jsonList.map((dynamic item) {
      return GameCard.decode(jsonEncode(item));
    }).toList();
  }

  Future<void> saveChanges(List<GameCard> cardList) async {
    await storage.write(key: SECURE_KEY, value: jsonEncode(cardList));
  }
}
