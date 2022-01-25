// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TaxSettingsModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaxSettingsModel _$TaxSettingsModelFromJson(Map<String, dynamic> json) =>
    TaxSettingsModel(
      tax_enable: json['tax_enable'] as int?,
      tax_number: json['tax_number'] as int?,
    );

Map<String, dynamic> _$TaxSettingsModelToJson(TaxSettingsModel instance) =>
    <String, dynamic>{
      'tax_enable': instance.tax_enable,
      'tax_number': instance.tax_number,
    };
