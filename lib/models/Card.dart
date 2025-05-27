
import 'package:json_annotation/json_annotation.dart';

part'Card.g.dart';

@JsonSerializable(explicitToJson:true, includeIfNull:true) //TODO add serialization with Card.g.dart
class Card{
  String name;
  String content;
  int _quantity=1;
  late String type;

  Card(this.name, this.content, this._quantity, this.type);

  Card.loot(this.name, this.content,int quantity){Card._(name,content,quantity,'LOOT CARD');}

  Card.move(this.name, this.content,int quantity){Card._(name,content,quantity,'MOVEMENT CARD');}

  Card.battle(this.name, this.content,int quantity){Card._(name,content,quantity,'BATTLE CARD');}

  Card.effect(this.name, this.content,int quantity){Card._(name,content,quantity,'EFFECT CARD');}

  Card._(this.name, this.content,int quantity, this.type){
   assert (this._quantity>0);
   this._quantity=quantity;
  }


}