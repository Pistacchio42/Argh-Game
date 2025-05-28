
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
  late String type;

  static const List<String> allTypes=['Tesoro', 'Movimento','Battaglia', 'Effetto'];
  static const Map<String, IconData> typeIcons = {
    'Tesoro': Icons.diamond,
    'Movimento': MyFlutterApp.radial_balance,
    'Battaglia': MyFlutterApp.crossed_pistols,
    'Effetto': MyFlutterApp.tentacle,
  };

  static final Map<String, Function> constructor={
  'Tesoro': (String name, String content, int _quantity)=> GameCard.loot(name, content, _quantity),
  'Movimento': (String name, String content, int _quantity)=> GameCard.move(name, content, _quantity),
  'Battaglia': (String name, String content, int _quantity)=> GameCard.battle(name, content, _quantity),
  'Effetto': (String name, String content, int _quantity)=> GameCard.effect(name, content, _quantity),
  };

  GameCard(this.name, this.content, this._quantity, this.type);

  GameCard.loot(this.name, this.content,int quantity){GameCard._(name,content,quantity,'LOOT CARD');}

  GameCard.move(this.name, this.content,int quantity){GameCard._(name,content,quantity,'MOVEMENT CARD');}

  GameCard.battle(this.name, this.content,int quantity){GameCard._(name,content,quantity,'BATTLE CARD');}

  GameCard.effect(this.name, this.content,int quantity){GameCard._(name,content,quantity,'EFFECT CARD');}

  GameCard._(this.name, this.content,int quantity, this.type){
   assert (this._quantity>0);
   this._quantity=quantity;
  }

  factory GameCard.fromJson(Map<String, dynamic> json)=> _$GameCardFromJson(json);
  Map<String, dynamic> toJson() => _$GameCardToJson(this);

}