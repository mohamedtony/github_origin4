import 'package:advertisers/app_core/network/models/NotificationsModel.dart';
import 'package:advertisers/app_core/network/models/PaginationModel.dart';
import 'package:advertisers/app_core/network/models/RequestModelData.dart';
import 'package:advertisers/app_core/network/models/User.dart';
import 'package:json_annotation/json_annotation.dart';

part 'NotificationsResponse.g.dart';

@JsonSerializable()
class NotificationsResponse {
  int? status;
  String? message;
  List<NotificationsModel>? data;
  PaginationModel? pagination;


  NotificationsResponse({
    this.status,
    this.message,
    this.data,
    this.pagination
  });

  factory NotificationsResponse.fromJson(Map<String, dynamic> json) =>
      _$NotificationsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationsResponseToJson(this);
}
