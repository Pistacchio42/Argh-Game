
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:argh/resources/flutter-icons-21a1aafc/my_flutter_app_icons.dart';

part 'GameCard.g.dart';

@JsonSerializable(explicitToJson:true, includeIfNull:true)
class GameCard{
  String name;
  String content;
  int _quantity=1;
  String type;

  static const List<String> allTypes=['Tesoro', 'Movimento','Battaglia', 'Effetto','Isola'];

  static const Map<String, IconData> typeIcons = {
    'Tesoro': Icons.diamond,
    'Movimento': MyFlutterApp.radial_balance,
    'Battaglia': MyFlutterApp.crossed_pistols,
    'Effetto': MyFlutterApp.tentacle,
    'Isola':MyFlutterApp.hive_emblem,
  };

  static const Map<String, Color> colorIcons = {
    'Tesoro': Color.fromARGB(255,110, 255, 255),
    'Movimento':Color.fromARGB(255,255, 191, 0),
    'Battaglia': Color.fromARGB(255,64, 64, 64),
    'Effetto': Color.fromARGB(255,199, 0, 57),
    'Isola': Color.fromARGB(255,190, 236, 120),
  };

  GameCard(this.name, this.content, this._quantity, this.type);

  GameCard.loot(name, content, quantity):name=name, content=content, _quantity=quantity, type='Tesoro';
  GameCard.move(name, content, quantity):name=name, content=content, _quantity=quantity, type=  'Movimento';
  GameCard.battle(name, content, quantity):name=name, content=content, _quantity=quantity, type='Battaglia';
  GameCard.effect(name, content, quantity):name=name, content=content, _quantity=quantity, type='Effetto';
  GameCard.island(name, content, quantity):name=name, content=content, _quantity=quantity, type='Isola';

  static Map<String, Function> allConstruction = {
    'Tesoro': (String name,String content,int _quantity)=>GameCard.loot(name, content, _quantity),
    'Movimento': (String name,String content,int _quantity)=>GameCard.move(name, content, _quantity),
    'Battaglia': (String name,String content,int _quantity)=>GameCard.battle(name, content, _quantity),
    'Effetto': (String name,String content,int _quantity)=>GameCard.effect(name, content, _quantity),
    'Isola': (String name,String content,int _quantity)=>GameCard.island(name, content, _quantity),
  };

  GameCard._(this.name, this.content,int quantity, this.type){
   assert (this._quantity>0);
   this._quantity=quantity;
   this.type=type;
  }

  String encode(GameCard card) {
    return jsonEncode(card);
  }

  static GameCard decode(String input){
     return GameCard.fromJson(jsonDecode(input) as Map<String, dynamic>);
  }

  GameCard.fromJson(Map<String, dynamic> json)
  :name= json['name'] as String,
        content= json['content']as String,
        _quantity= json['qty'],
        type=json['type']as String;

  Map<String, dynamic> toJson()=>{'name':name, 'content':content, 'qty':_quantity, 'type':type};
}