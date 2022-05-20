import 'package:advertisers/app_core/network/models/User.dart';
import 'package:json_annotation/json_annotation.dart';
part 'NotificationsModel.g.dart';

@JsonSerializable()
class NotificationsModel {
  int? id,user_id,starred;
  String? type,model_id,model_type,title,body,created_at;
  User? user;
  bool? seen;

  NotificationsModel({this.id,this.user_id,this.user,this.title,this.body,this.created_at,this.model_id,this.type,this.model_type,this.starred,this.seen});

  factory NotificationsModel.fromJson(Map<String, dynamic> json) => _$NotificationsModelFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationsModelToJson(this);
}

