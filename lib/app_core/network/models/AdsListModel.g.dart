// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AdsListModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdsListModel _$AdsListModelFromJson(Map<String, dynamic> json) => AdsListModel(
      time_ago: json['time_ago'] as String?,
      id: json['id'] as int?,
      is_liked: json['is_liked'] as bool?,
      is_disliked: json['is_disliked'] as bool?,
      status: json['status'] as String?,
      video: json['video'] as String?,
      image: json['image'] as String?,
      user: json['user'] == null
          ? null
          : UserAdsList.fromJson(json['user'] as Map<String, dynamic>),
      likes: json['likes'] as int?,
      dislikes: json['dislikes'] as int?,
      shares: json['shares'] as int?,
      status_txt: json['status_txt'] as String?,
      description: json['description'] as String?,
      type: json['type'] as String?,
      views: json['views'] as int?,
      attachments: (json['attachments'] as List<dynamic>?)
          ?.map((e) => Attachment.fromJson(e as Map<String, dynamic>))
          .toList(),
      started_at: json['started_at'] as String?,
      attachment_preview_duration: json['attachment_preview_duration'] as int?,
      comments: json['comments'] as int?,
      favourites: json['favourites'] as int?,
      has_comment: json['has_comment'] as bool?,
      is_favourite: json['is_favourite'] as bool?,
      show_app: json['show_app'] as int?,
      show_profile: json['show_profile'] as int?,
    );

Map<String, dynamic> _$AdsListModelToJson(AdsListModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'status_txt': instance.status_txt,
      'started_at': instance.started_at,
      'show_app': instance.show_app,
      'show_profile': instance.show_profile,
      'type': instance.type,
      'is_favourite': instance.is_favourite,
      'is_liked': instance.is_liked,
      'is_disliked': instance.is_disliked,
      'has_comment': instance.has_comment,
      'user': instance.user,
      'comments': instance.comments,
      'favourites': instance.favourites,
      'likes': instance.likes,
      'dislikes': instance.dislikes,
      'shares': instance.shares,
      'views': instance.views,
      'description': instance.description,
      'image': instance.image,
      'video': instance.video,
      'attachment_preview_duration': instance.attachment_preview_duration,
      'attachments': instance.attachments,
      'time_ago': instance.time_ago,
    };
