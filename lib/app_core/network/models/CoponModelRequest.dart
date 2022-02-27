

import 'dart:io';

import 'package:advertisers/app_core/network/models/Country.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/http.dart';
import 'Area.dart';
part 'CoponModelRequest.g.dart';

@JsonSerializable()
class CoponModelRequest {
  //File? image;
  String? code;
  String? name;
  int? discount;
  int?uses;
  String? link;
  String? ended_at;



  CoponModelRequest({
    //this.image,
    this.code,
    this.name,
    this.discount,
    this.ended_at,
    this.link,
    this.uses,
  });


  factory CoponModelRequest.fromJson(Map<String, dynamic> json) => _$CoponModelRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CoponModelRequestToJson(this);
}

