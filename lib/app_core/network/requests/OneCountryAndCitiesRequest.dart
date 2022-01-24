import 'package:json_annotation/json_annotation.dart';

part 'OneCountryAndCitiesRequest.g.dart';

@JsonSerializable()
class OneCountryAndCitiesRequest {

  List<int>?countries;
  List<int>? areas;

  OneCountryAndCitiesRequest({this.countries, this.areas});

  factory OneCountryAndCitiesRequest.fromJson(Map<String, dynamic> json) =>
      _$OneCountryAndCitiesRequestFromJson(json);

  Map<String, dynamic> toJson() => _$OneCountryAndCitiesRequestToJson(this);
}