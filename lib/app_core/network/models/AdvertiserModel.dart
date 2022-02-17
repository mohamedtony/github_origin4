
import 'package:advertisers/app_core/network/models/AdvertiserStatistics.dart';
import 'package:advertisers/app_core/network/models/SocialsModel.dart';
import 'package:json_annotation/json_annotation.dart';


part 'AdvertiserModel.g.dart';

@JsonSerializable()
class AdvertiserModel {
  int? id,payments;
  String? username,phone,whatsapp;
  String? role,company_name,rate;
  String? image,added_from;
  AdvertiserStatistics? requests;
  SocialsModel? socials;





  AdvertiserModel({this.id, this.username, this.role,this.image,this.requests,this.socials,
  this.rate,this.payments,this.added_from,this.whatsapp,this.company_name,this.phone});

  factory AdvertiserModel.fromJson(Map<String, dynamic> json) => _$AdvertiserModelFromJson(json);

  Map<String, dynamic> toJson() => _$AdvertiserModelToJson(this);
}

