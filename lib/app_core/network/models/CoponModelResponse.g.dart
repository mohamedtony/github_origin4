// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CoponModelResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoponModelResponse _$CoponModelResponseFromJson(Map<String, dynamic> json) =>
    CoponModelResponse(
      selected: json['selected'] as bool?,
      shares: json['shares'] as int?,
      views: json['views'] as int?,
      dislikes: json['dislikes'] as int?,
      likes: json['likes'] as int?,
      belongs_me: json['belongs_me'] as bool?,
      is_liked: json['is_liked'] as bool?,
      link: json['link'] as String?,
      id: json['id'] as int?,
      status_txt: json['status_txt'] as String?,
      used: json['used'] as int?,
      can_edit: json['can_edit'] as bool?,
      users: json['users'] as int?,
      store_name: json['store_name'] as String?,
      started_at: json['started_at'] as String?,
      ended_at: json['ended_at'] as String?,
      description: json['description'] as String?,
      status: json['status'] as int?,
      name: json['name'] as String?,
      uses: json['uses'] as int?,
      discount: json['discount'] as int?,
      code: json['code'] as String?,
      image: json['image'] as String?,
      type: json['type'] as String?,
      ads_request_id: json['ads_request_id'] as int?,
      discount_type: json['discount_type'] as String?,
      user_id: json['user_id'] as int?,
    );

Map<String, dynamic> _$CoponModelResponseToJson(CoponModelResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'status_txt': instance.status_txt,
      'code': instance.code,
      'type': instance.type,
      'discount': instance.discount,
      'started_at': instance.started_at,
      'ended_at': instance.ended_at,
      'name': instance.name,
      'image': instance.image,
      'link': instance.link,
      'is_liked': instance.is_liked,
      'uses': instance.uses,
      'used': instance.used,
      'description': instance.description,
      'user_id': instance.user_id,
      'ads_request_id': instance.ads_request_id,
      'discount_type': instance.discount_type,
      'likes': instance.likes,
      'dislikes': instance.dislikes,
      'views': instance.views,
      'users': instance.users,
      'shares': instance.shares,
      'selected': instance.selected,
      'store_name': instance.store_name,
      'can_edit': instance.can_edit,
      'belongs_me': instance.belongs_me,
    };
