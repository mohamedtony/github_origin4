import 'package:advertisers/app_core/network/models/AdTypeModel.dart';
import 'package:advertisers/app_core/network/models/AdvertiserModel.dart';
import 'package:advertisers/app_core/network/models/Attachment.dart';
import 'package:advertisers/app_core/network/models/CategoryModel.dart';
import 'package:advertisers/app_core/network/models/Channel.dart';
import 'package:advertisers/app_core/network/models/CoponModelRequest.dart';
import 'package:advertisers/app_core/network/models/CoponModelResponse.dart';
import 'package:advertisers/app_core/network/models/LinkModel.dart';
import 'package:advertisers/app_core/network/models/LocationModel.dart';
import 'package:advertisers/app_core/network/models/ProductType.dart';
import 'package:advertisers/app_core/network/models/User.dart';
import 'package:json_annotation/json_annotation.dart';
part 'RequestDetailsModel.g.dart';

@JsonSerializable()
class RequestDetailsModel {
  int? id;
  String? status;
  String? status_txt;
  String? description;
  bool? inline;
  CategoryModel? product_type;
  AdvertiserModel? advertiser;
  User? user;
  AdTypeModel? ads_type;
  List<Channel>? channels;
  List<Attachment>? attachments;
  List<LinkModel>? links;
  LocationModel? address;
  CoponModelResponse? copon;
  String? notes,plan_file,added_at,started_at,ended_at,offer_ended_at,added_to;
  int?repeat_count;
  RequestDetailsModel({this.repeat_count,this.id,this.address,this.links,this.status,this.advertiser,this.started_at,this.offer_ended_at,this.notes,this.description,this.copon,this.attachments,this.channels
  ,this.ended_at,this.added_at,this.added_to,this.ads_type,this.plan_file,this.product_type,this.status_txt,this.user,this.inline});


  factory RequestDetailsModel.fromJson(Map<String, dynamic> json) => _$RequestDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$RequestDetailsModelToJson(this);
}

