import 'package:advertisers/app_core/network/models/FilterValuesModel.dart';
import 'package:advertisers/app_core/network/models/FilterValuesModel.dart';
import 'package:json_annotation/json_annotation.dart';
part 'StarNotificationModel.g.dart';

@JsonSerializable()
class StarNotificationModel {


  bool? starred;


  StarNotificationModel({
    this.starred,
  });

  factory StarNotificationModel.fromJson(Map<String, dynamic> json) => _$StarNotificationModelFromJson(json);

  Map<String, dynamic> toJson() => _$StarNotificationModelToJson(this);
}

