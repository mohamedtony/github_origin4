// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TaxSettingsModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaxSettingsModel _$TaxSettingsModelFromJson(Map<String, dynamic> json) =>
    TaxSettingsModel(
      tax_enable: json['tax_enable'] as String?,
      tax_number: json['tax_number'] as String?,
    );

Map<String, dynamic> _$TaxSettingsModelToJson(TaxSettingsModel instance) =>
    <String, dynamic>{
      'tax_enable': instance.tax_enable,
      'tax_number': instance.tax_number,
    };
