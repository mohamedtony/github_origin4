import 'package:advertisers/app_core/network/models/Country.dart';
import 'package:json_annotation/json_annotation.dart';
import 'Area.dart';
part 'CountriesAreasModel.g.dart';

@JsonSerializable()
class CountriesAreasModel {
  List<Country>? countries;
  List<Area>? areas;

  CountriesAreasModel({
    this.countries,
    this.areas
  });

  factory CountriesAreasModel.fromJson(Map<String, dynamic> json) => _$CountriesAreasModelFromJson(json);

  Map<String, dynamic> toJson() => _$CountriesAreasModelToJson(this);
}

