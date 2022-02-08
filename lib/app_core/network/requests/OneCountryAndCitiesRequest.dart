import 'package:json_annotation/json_annotation.dart';

part 'OneCountryAndCitiesRequest.g.dart';

@JsonSerializable()
class OneCountryAndCitiesRequest {

  List<int>?countries;
  List<int>? areas;
  List<int>? country_category;
  OneCountryAndCitiesRequest({this.countries, this.areas,this.country_category});

  factory OneCountryAndCitiesRequest.fromJson(Map<String, dynamic> json) =>
      _$OneCountryAndCitiesRequestFromJson(json);

  Map<String, dynamic> toJson() => _$OneCountryAndCitiesRequestToJson(this);
}