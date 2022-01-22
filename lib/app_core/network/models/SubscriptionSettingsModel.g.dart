// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SubscriptionSettingsModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubscriptionSettingsModel _$SubscriptionSettingsModelFromJson(
        Map<String, dynamic> json) =>
    SubscriptionSettingsModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      key: json['key'] as String?,
      group: json['group'] as String?,
      pivot: json['pivot'] == null
          ? null
          : SubscriptionPivotModel.fromJson(
              json['pivot'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SubscriptionSettingsModelToJson(
        SubscriptionSettingsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'key': instance.key,
      'group': instance.group,
      'pivot': instance.pivot,
    };
