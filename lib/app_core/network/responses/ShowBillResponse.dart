import 'package:advertisers/app_core/network/models/Company.dart';
import 'package:advertisers/app_core/network/models/ReasonDataModel.dart';
import 'package:advertisers/app_core/network/models/ShowBillModel.dart';
import 'package:advertisers/app_core/network/models/User.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ShowBillResponse.g.dart';

@JsonSerializable()
class ShowBillResponse {
  int? status;
  String? message;
  ShowBillModel? data;


  ShowBillResponse({
    this.status,
    this.message,
    this.data,
  });

  factory ShowBillResponse.fromJson(Map<String, dynamic> json) =>
      _$ShowBillResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ShowBillResponseToJson(this);
}
