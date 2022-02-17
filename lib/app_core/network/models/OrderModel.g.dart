// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'OrderModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) => OrderModel(
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
      advertiserModel: json['advertiserModel'] == null
          ? null
          : AdvertiserModel.fromJson(
              json['advertiserModel'] as Map<String, dynamic>),
      comments: json['comments'] as int?,
      views: json['views'] as int?,
    );

Map<String, dynamic> _$OrderModelToJson(OrderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'can_edit': instance.can_edit,
      'user': instance.user,
      'created_at': instance.created_at,
      'product_type': instance.product_type,
      'title': instance.title,
      'description': instance.description,
      'status': instance.status,
      'advertiserModel': instance.advertiserModel,
      'comments': instance.comments,
      'views': instance.views,
    };
