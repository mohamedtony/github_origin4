import 'package:advertisers/app_core/network/models/AdvertiserModel.dart';
import 'package:advertisers/app_core/network/models/ProductType.dart';
import 'package:advertisers/app_core/network/models/StatusesModel.dart';
import 'package:advertisers/app_core/network/models/User.dart';
import 'package:json_annotation/json_annotation.dart';
part 'RequestModel.g.dart';

@JsonSerializable()
class RequestModel {
  int? id,bill_id;
  String? status,status_txt;
  bool? can_edit;
  User? user;
  String? address;
  String? created_at;
  ProductType? product_type;
  String? title;
  String? description;
  StatusesModel? statuses;
  double? bill_total;
  AdvertiserModel? advertiser;
  int? comments;
  int? views;
  RequestModel({
    this.id,
    this.can_edit,
    this.user,
    this.created_at,
    this.product_type,
    this.title,
    this.description,this.status,this.advertiser,this.comments,this.views,this.address,this.bill_id,this.status_txt,
    this.statuses,this.bill_total
  });


  factory RequestModel.fromJson(Map<String, dynamic> json) => _$RequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$RequestModelToJson(this);
}

