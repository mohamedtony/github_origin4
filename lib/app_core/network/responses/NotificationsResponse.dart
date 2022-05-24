import 'package:advertisers/app_core/network/models/NotificationsModel.dart';
import 'package:advertisers/app_core/network/models/RequestModelData.dart';
import 'package:advertisers/app_core/network/models/User.dart';
import 'package:json_annotation/json_annotation.dart';

part 'NotificationsResponse.g.dart';

@JsonSerializable()
class NotificationsResponse {
  int? status;
  String? message;
  List<NotificationsModel>? data;


  NotificationsResponse({
    this.status,
    this.message,
    this.data,
  });

  factory NotificationsResponse.fromJson(Map<String, dynamic> json) =>
      _$NotificationsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationsResponseToJson(this);
}
