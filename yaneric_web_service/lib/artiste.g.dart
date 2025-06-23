// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artiste.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Artiste _$ArtisteFromJson(Map<String, dynamic> json) =>
    Artiste((json['id'] as num).toInt(), json['titre'] as String);

Map<String, dynamic> _$ArtisteToJson(Artiste instance) => <String, dynamic>{
  'id': instance.id,
  'titre': instance.titre,
};
