// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RequestDetailsModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestDetailsModel _$RequestDetailsModelFromJson(Map<String, dynamic> json) =>
    RequestDetailsModel(
      id: json['id'] as int?,
      address: json['address'] == null
          ? null
          : LocationModel.fromJson(json['address'] as Map<String, dynamic>),
      links: (json['links'] as List<dynamic>?)
          ?.map((e) => LinkModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String?,
      advertiser: json['advertiser'] == null
          ? null
          : AdvertiserModel.fromJson(
              json['advertiser'] as Map<String, dynamic>),
      started_at: json['started_at'] as String?,
      offer_ended_at: json['offer_ended_at'] as String?,
      notes: json['notes'] as String?,
      description: json['description'] as String?,
      copon: json['copon'] == null
          ? null
          : CoponModelResponse.fromJson(json['copon'] as Map<String, dynamic>),
      attachments: (json['attachments'] as List<dynamic>?)
          ?.map((e) => Attachment.fromJson(e as Map<String, dynamic>))
          .toList(),
      channels: (json['channels'] as List<dynamic>?)
          ?.map((e) => Channel.fromJson(e as Map<String, dynamic>))
          .toList(),
      ended_at: json['ended_at'] as String?,
      added_at: json['added_at'] as String?,
      added_to: json['added_to'] as String?,
      ads_type: json['ads_type'] == null
          ? null
          : AdTypeModel.fromJson(json['ads_type'] as Map<String, dynamic>),
      plan_file: json['plan_file'] as String?,
      product_type: json['product_type'] == null
          ? null
          : CategoryModel.fromJson(
              json['product_type'] as Map<String, dynamic>),
      status_txt: json['status_txt'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      inline: json['inline'] as bool?,
    );

Map<String, dynamic> _$RequestDetailsModelToJson(
        RequestDetailsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'status_txt': instance.status_txt,
      'description': instance.description,
      'inline': instance.inline,
      'product_type': instance.product_type,
      'advertiser': instance.advertiser,
      'user': instance.user,
      'ads_type': instance.ads_type,
      'channels': instance.channels,
      'attachments': instance.attachments,
      'links': instance.links,
      'address': instance.address,
      'copon': instance.copon,
      'notes': instance.notes,
      'plan_file': instance.plan_file,
      'added_at': instance.added_at,
      'started_at': instance.started_at,
      'ended_at': instance.ended_at,
      'offer_ended_at': instance.offer_ended_at,
      'added_to': instance.added_to,
    };
