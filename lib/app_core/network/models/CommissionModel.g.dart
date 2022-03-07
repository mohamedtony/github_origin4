// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CommissionModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommissionModel _$CommissionModelFromJson(Map<String, dynamic> json) =>
    CommissionModel(
      value: json['value'] as int?,
      percentage: json['percentage'] as int?,
    );

Map<String, dynamic> _$CommissionModelToJson(CommissionModel instance) =>
    <String, dynamic>{
      'percentage': instance.percentage,
      'value': instance.value,
    };
