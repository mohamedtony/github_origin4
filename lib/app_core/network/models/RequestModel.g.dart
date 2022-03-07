// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RequestModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestModel _$RequestModelFromJson(Map<String, dynamic> json) => RequestModel(
      id: json['id'] as int?,
      can_edit: json['can_edit'] as bool?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      created_at: json['created_at'] as String?,
      product_type: json['product_type'] == null
          ? null
          : ProductType.fromJson(json['product_type'] as Map<String, dynamic>),
      title: json['title'] as String?,
      description: json['description'] as String?,
      status: json['status'] as String?,
      advertiser: json['advertiser'] == null
          ? null
          : AdvertiserModel.fromJson(
              json['advertiser'] as Map<String, dynamic>),
      comments: json['comments'] as int?,
      views: json['views'] as int?,
      address: json['address'] as String?,
      bill_id: json['bill_id'] as int?,
      status_txt: json['status_txt'] as String?,
      statuses: json['statuses'] == null
          ? null
          : StatusesModel.fromJson(json['statuses'] as Map<String, dynamic>),
      bill_total: (json['bill_total'] as num?)?.toDouble(),
      inline: json['inline'] as bool?,
    );

Map<String, dynamic> _$RequestModelToJson(RequestModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'bill_id': instance.bill_id,
      'status': instance.status,
      'status_txt': instance.status_txt,
      'can_edit': instance.can_edit,
      'inline': instance.inline,
      'user': instance.user,
      'address': instance.address,
      'created_at': instance.created_at,
      'product_type': instance.product_type,
      'title': instance.title,
      'description': instance.description,
      'statuses': instance.statuses,
      'bill_total': instance.bill_total,
      'advertiser': instance.advertiser,
      'comments': instance.comments,
      'views': instance.views,
    };
