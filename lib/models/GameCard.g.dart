part of 'GameCard.dart';

GameCard _$GameCardFromJson(Map<String, dynamic> json) => GameCard(
  json['name'] as String,
  json['content'] as String,
  int.parse(json['qty'] as String),
  json['type'] as String,
);

Map<String, dynamic> _$GameCardToJson(GameCard instance) => <String, dynamic>{
  "name": instance.name,
  "content": instance.content,
  "qty":instance._quantity,
  "type":instance.type
};