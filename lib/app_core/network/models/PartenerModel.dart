import 'package:advertisers/app_core/network/models/ProfileAdvertiserStopSettings.dart';
import 'package:advertisers/app_core/network/models/ReasonModel.dart';
import 'package:json_annotation/json_annotation.dart';
part 'PartenerModel.g.dart';


@JsonSerializable()
class PartnerModel {

  int? id;
  String? name;
  String? content;

  PartnerModel({
    this.name,
    this.content,this.id,

  });

  factory PartnerModel.fromJson(Map<String, dynamic> json) => _$PartnerModelFromJson(json);

  Map<String, dynamic> toJson() => _$PartnerModelToJson(this);
}

