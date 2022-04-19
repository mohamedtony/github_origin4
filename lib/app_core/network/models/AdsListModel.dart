import 'package:advertisers/app_core/network/models/Attachment.dart';
import 'package:advertisers/app_core/network/models/UserAdsList.dart';
import 'package:json_annotation/json_annotation.dart';
part 'AdsListModel.g.dart';

@JsonSerializable()
class AdsListModel {
  int? id;
  String? status;
  String? status_txt;
  String? started_at;
  int? show_app;
  int? show_profile;
  String? type;
  bool?is_favourite;
  bool?has_comment;
  UserAdsList? user;
  int?comments;
  int?favourites;
  int?likes;
  int?dislikes;
  int?shares;
  int?views;
  String?description;
  String?image;
  String?video;
  int?attachment_preview_duration;
  List<Attachment>? attachments;
  String? time_ago;

  AdsListModel({this.time_ago,this.id,this.status,this.video,this.image,this.user,this.likes,this.dislikes,this.shares,this.status_txt,this.description,this.type,this.views,this.attachments,this.started_at,this.attachment_preview_duration,this.comments,this.favourites,this.has_comment,this.is_favourite,this.show_app,this.show_profile,});

  factory AdsListModel.fromJson(Map<String, dynamic> json) => _$AdsListModelFromJson(json);

  Map<String, dynamic> toJson() => _$AdsListModelToJson(this);
}


