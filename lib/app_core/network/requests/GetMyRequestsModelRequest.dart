import 'package:json_annotation/json_annotation.dart';

part 'GetMyRequestsModelRequest.g.dart';
@JsonSerializable()
class GetMyRequestsModelRequest {
  int?archive;
  String?keyword;
  String? sort_by;
  String? from_date;
  String? to_date;
  String? advertiser_name;
  String? areas;
  String? countries;
  String?country_category;
  String? filters;
  int? page;

  GetMyRequestsModelRequest({this.archive,this.filters,this.sort_by,this.advertiser_name,this.from_date, this.areas,this.to_date,this.keyword,this.page,this.countries,this.country_category});

  factory GetMyRequestsModelRequest.fromJson(Map<String, dynamic> json) =>
      _$GetMyRequestsModelRequestFromJson(json);

  Map<String, dynamic> toJson() => _$GetMyRequestsModelRequestToJson(this);
}