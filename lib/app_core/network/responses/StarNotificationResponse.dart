import 'package:advertisers/app_core/network/models/Company.dart';
import 'package:advertisers/app_core/network/models/ReasonDataModel.dart';
import 'package:advertisers/app_core/network/models/ShowBillModel.dart';
import 'package:advertisers/app_core/network/models/StarModel.dart';
import 'package:advertisers/app_core/network/models/StarNotificationModel.dart';
import 'package:advertisers/app_core/network/models/User.dart';
import 'package:json_annotation/json_annotation.dart';

part 'StarNotificationResponse.g.dart';

@JsonSerializable()
class StarNotificationResponse {
  int? status;
  String? message;
  StarNotificationModel? data;


  StarNotificationResponse({
    this.status,
    this.message,
    this.data,
  });

  factory StarNotificationResponse.fromJson(Map<String, dynamic> json) =>
      _$StarNotificationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$StarNotificationResponseToJson(this);
}
