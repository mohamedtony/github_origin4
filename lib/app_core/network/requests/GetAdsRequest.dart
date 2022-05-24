import 'package:json_annotation/json_annotation.dart';

part 'GetAdsRequest.g.dart';
@JsonSerializable()
class GetAdsRequest {
  int? user_id;
 // @JsonKey(name: 'ads_types[]')
  String? ads_types;
 // @JsonKey(name: 'filters[]')
  String?filters;
  //@JsonKey(name: 'countries[]')
  String?countries;
  //@JsonKey(name: 'areas[]')
  String? areas;
 // @JsonKey(name: 'country_category[]')
  String? country_category;
  int? page;
  int? distance_from;
  int? distance_to;
  String? name;
  String? date_from;
  String?date_to;

  GetAdsRequest({this.user_id,this.page,this.ads_types,this.filters,this.countries, this.areas,this.country_category,this.distance_from,this.distance_to,this.name,this.date_from,this.date_to});

  factory GetAdsRequest.fromJson(Map<String, dynamic> json) =>
      _$GetAdsRequestFromJson(json);

  Map<String, dynamic> toJson() => _$GetAdsRequestToJson(this);
}