

import 'package:json_annotation/json_annotation.dart';

import 'Area.dart';


part 'Country.g.dart';

@JsonSerializable()
class Country {
  int? id;
  String? name;
  String? phone_key;
  String? iso_name;
  List<Area>? areas;

  Country({
    this.id,
    this.name,
    this.phone_key,
    this.areas
  });
  String countryAsStringByName() {
    return this.name!;
  }
  factory Country.fromJson(Map<String, dynamic> json) => _$CountryFromJson(json);

  Map<String, dynamic> toJson() => _$CountryToJson(this);
}

