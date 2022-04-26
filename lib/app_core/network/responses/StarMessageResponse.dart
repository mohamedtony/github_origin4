import 'package:advertisers/app_core/network/models/Company.dart';
import 'package:advertisers/app_core/network/models/ReasonDataModel.dart';
import 'package:advertisers/app_core/network/models/ShowBillModel.dart';
import 'package:advertisers/app_core/network/models/StarModel.dart';
import 'package:advertisers/app_core/network/models/User.dart';
import 'package:json_annotation/json_annotation.dart';

part 'StarMessageResponse.g.dart';

@JsonSerializable()
class StarMessageResponse {
  int? status;
  String? message;
  StarModel? data;


  StarMessageResponse({
    this.status,
    this.message,
    this.data,
  });

  factory StarMessageResponse.fromJson(Map<String, dynamic> json) =>
      _$StarMessageResponseFromJson(json);

  Map<String, dynamic> toJson() => _$StarMessageResponseToJson(this);
}
