import 'package:json_annotation/json_annotation.dart';
part 'CoponModelResponse.g.dart';

@JsonSerializable()
class CoponModelResponse {
  int? id;
  int? status;
  String? code,type;
  int?discount;
  String? started_at;
  String? ended_at;
  String? name;
  String? image;
 // "marketer_ratio": null,
  int? uses;
  String? description;
  int? user_id,ads_request_id;
  String?discount_type;


  CoponModelResponse({
    this.id,
    this.started_at,this.ended_at,this.description,this.status,this.name,this.uses,this.discount,this.code,this.image,this.type,this.ads_request_id,this.discount_type,this.user_id
  });

  factory CoponModelResponse.fromJson(Map<String, dynamic> json) => _$CoponModelResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CoponModelResponseToJson(this);
}

