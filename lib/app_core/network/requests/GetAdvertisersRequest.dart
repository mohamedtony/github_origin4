import 'package:json_annotation/json_annotation.dart';

part 'GetAdvertisersRequest.g.dart';
@JsonSerializable()
class GetAdvertisersRequest {
 String? sort_by;
 List<int>?categories;
  List<int>?countries;
  List<int>? areas;
  List<int>? country_category;
  int? page;
 String? keyword;

  GetAdvertisersRequest({this.page,this.sort_by,this.categories,this.countries, this.areas,this.country_category,this.keyword});

  factory GetAdvertisersRequest.fromJson(Map<String, dynamic> json) =>
      _$GetAdvertisersRequestFromJson(json);

  Map<String, dynamic> toJson() => _$GetAdvertisersRequestToJson(this);
}