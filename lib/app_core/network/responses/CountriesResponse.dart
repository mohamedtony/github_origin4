
// import 'package:advertisers/shared/network/models/Area.dart';
// import 'package:advertisers/shared/network/models/Country.dart';
import 'package:advertisers/app_core/network/models/Country.dart';
import 'package:json_annotation/json_annotation.dart';
part 'CountriesResponse.g.dart';

@JsonSerializable()
class CountriesResponse {
  int? status;
  String? message;
  List<Country>? data;

  CountriesResponse({
    this.status,
    this.message,
    this.data,
  });

  factory CountriesResponse.fromJson(Map<String, dynamic> json) =>
      _$CountriesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CountriesResponseToJson(this);
}

