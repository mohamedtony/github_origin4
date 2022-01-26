// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CoponModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoponModel _$CoponModelFromJson(Map<String, dynamic> json) => CoponModel(
      copon_id: json['copon_id'] as int?,
      total: (json['total'] as num?)?.toDouble(),
      discount: (json['discount'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$CoponModelToJson(CoponModel instance) =>
    <String, dynamic>{
      'copon_id': instance.copon_id,
      'total': instance.total,
      'discount': instance.discount,
    };
