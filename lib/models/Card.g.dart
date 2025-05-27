part of 'Card.dart';

Card _$CardFromJson(Map<String, dynamic> json) => Card(
  json['name'] as String,
  json['content'] as String,
  json['qty'] as int,
  json['type'] as String,
);

Map<String, dynamic> _$CardToJson(Card instance) => <String, dynamic>{
  "name": instance.name,
  "content": instance.content,
  "qty":instance._quantity,
  "type":instance.type
};