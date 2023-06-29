// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'putdb.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyCard _$MyCardFromJson(Map<String, dynamic> json) => MyCard(
      username: json['username'] as String?,
      name: json['name'] as String?,
      password: json['password'] as String?,
      pic: json['pic'] as List<dynamic>?,
    );

Map<String, dynamic> _$MyCardToJson(MyCard instance) => <String, dynamic>{
      'username': instance.username,
      'name': instance.name,
      'password': instance.password,
      'pic': instance.pic,
    };
