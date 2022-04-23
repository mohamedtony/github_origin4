// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Country.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Country _$CountryFromJson(Map<String, dynamic> json) => Country(
      id: json['id'] as int?,
      name: json['name'] as String?,
      phone_key: json['phone_key'] as String?,
      areas: (json['areas'] as List<dynamic>?)
          ?.map((e) => Area.fromJson(e as Map<String, dynamic>))
          .toList(),
      type: json['type'] as String?,
      image: json['image'] as String?,
    )..iso_name = json['iso_name'] as String?;

Map<String, dynamic> _$CountryToJson(Country instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone_key': instance.phone_key,
      'iso_name': instance.iso_name,
      'areas': instance.areas,
      'type': instance.type,
      'image': instance.image,
    };
