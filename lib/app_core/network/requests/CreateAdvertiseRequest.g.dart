// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CreateAdvertiseRequest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateAdvertiseRequest _$CreateAdvertiseRequestFromJson(
        Map<String, dynamic> json) =>
    CreateAdvertiseRequest(
      advertiser_id: json['advertiser_id'] as int?,
      ended_at: json['ended_at'] as String?,
      channels:
          (json['channels'] as List<dynamic>?)?.map((e) => e as int).toList(),
      links: (json['links'] as List<dynamic>?)
          ?.map((e) => LinkModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      ads_type_id: json['ads_type_id'] as int?,
      copon: json['copon'] == null
          ? null
          : CoponModelRequest.fromJson(json['copon'] as Map<String, dynamic>),
      date_type: json['date_type'] as String?,
      description: json['description'] as String?,
      location: json['location'] == null
          ? null
          : LocationModel.fromJson(json['location'] as Map<String, dynamic>),
      notes: json['notes'] as String?,
      offer_ended_at: json['offer_ended_at'] as String?,
      product_category_id: json['product_category_id'] as int?,
      repeat_count: json['repeat_count'] as int?,
      started_at: json['started_at'] as String?,
    );

Map<String, dynamic> _$CreateAdvertiseRequestToJson(
        CreateAdvertiseRequest instance) =>
    <String, dynamic>{
      'advertiser_id': instance.advertiser_id,
      'product_category_id': instance.product_category_id,
      'description': instance.description,
      'ads_type_id': instance.ads_type_id,
      'date_type': instance.date_type,
      'started_at': instance.started_at,
      'ended_at': instance.ended_at,
      'offer_ended_at': instance.offer_ended_at,
      'repeat_count': instance.repeat_count,
      'channels': instance.channels,
      'links': instance.links,
      'location': instance.location,
      'copon': instance.copon,
      'notes': instance.notes,
    };
