// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfert_http.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(json['name'] as String);

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
  'name': instance.name,
};

Repo _$RepoFromJson(Map<String, dynamic> json) =>
    Repo(json['name'] as String, json['private'] as bool);

Map<String, dynamic> _$RepoToJson(Repo instance) => <String, dynamic>{
  'name': instance.name,
  'private': instance.private,
};
