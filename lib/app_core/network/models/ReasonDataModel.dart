import 'package:advertisers/app_core/network/models/AdvertiserModel.dart';
import 'package:advertisers/app_core/network/models/User.dart';
import 'package:json_annotation/json_annotation.dart';
part 'ReasonDataModel.g.dart';

@JsonSerializable()
class ReasonDataModel {

  int? id;
  String? reason,status;
  AdvertiserModel? advertiser;
  User? user;
  ReasonDataModel({
    this.reason,this.id,this.status,this.advertiser,this.user
  });

  factory ReasonDataModel.fromJson(Map<String, dynamic> json) => _$ReasonDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReasonDataModelToJson(this);
}

