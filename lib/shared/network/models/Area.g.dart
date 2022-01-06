// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Area.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Area _$AreaFromJson(Map<String, dynamic> json) => Area(
      id: json['id'] as int?,
      country_id: json['country_id'] as int?,
      name: json['name'] as String?,
      area_code: json['area_code'] as String?,
    );

Map<String, dynamic> _$AreaToJson(Area instance) => <String, dynamic>{
      'id': instance.id,
      'country_id': instance.country_id,
      'name': instance.name,
      'area_code': instance.area_code,
    };
