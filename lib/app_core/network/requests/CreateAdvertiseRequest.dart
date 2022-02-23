import 'dart:io';

import 'package:advertisers/app_core/network/models/CoponModelRequest.dart';
import 'package:advertisers/app_core/network/models/LinkModel.dart';
import 'package:advertisers/app_core/network/models/LocationModel.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/http.dart';

part 'CreateAdvertiseRequest.g.dart';

@JsonSerializable()
class CreateAdvertiseRequest {
  @Part(name: 'advertiser_id')
  int? advertiser_id;
  @Part(name: 'product_category_id')
  int? product_category_id;
  String? description;
  int? ads_type_id;
  String? date_type;
  String? started_at;
  String? ended_at;
  String? offer_ended_at;
  int? repeat_count;
  List<int>?channels;
  //List<File>? attachments;
  List<LinkModel>? links;
  LocationModel? location;
  CoponModelRequest? copon;
  String? notes;



  CreateAdvertiseRequest({this.advertiser_id, this.ended_at,this.channels,this.links,this.ads_type_id,/*this.attachments,*/this.copon,this.date_type,this.description,this.location,this.notes,this.offer_ended_at,this.product_category_id,this.repeat_count,this.started_at,});

  factory CreateAdvertiseRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateAdvertiseRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateAdvertiseRequestToJson(this);
}
