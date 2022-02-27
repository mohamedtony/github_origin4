// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ReasonDataModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReasonDataModel _$ReasonDataModelFromJson(Map<String, dynamic> json) =>
    ReasonDataModel(
      reason: json['reason'] as String?,
      id: json['id'] as int?,
      status: json['status'] as String?,
      advertiser: json['advertiser'] == null
          ? null
          : AdvertiserModel.fromJson(
              json['advertiser'] as Map<String, dynamic>),
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ReasonDataModelToJson(ReasonDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'reason': instance.reason,
      'status': instance.status,
      'advertiser': instance.advertiser,
      'user': instance.user,
    };
