

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
  String? type;
  String?image;

  Country({
    this.id,
    this.name,
    this.phone_key,
    this.areas,
    this.type,
    this.image
  });
  String itemAsStringByName() {
    return this.name!=null?this.name!:"";
  }
  factory Country.fromJson(Map<String, dynamic> json) => _$CountryFromJson(json);

  Map<String, dynamic> toJson() => _$CountryToJson(this);
}

