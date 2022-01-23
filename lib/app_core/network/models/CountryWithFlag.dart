import 'package:json_annotation/json_annotation.dart';



part 'CountryWithFlag.g.dart';

@JsonSerializable()
class CountryWithFlag {
  int? id;
  String? name;
  String? image;


  CountryWithFlag({
    this.id,
    this.name,
    this.image,
  });

  factory CountryWithFlag.fromJson(Map<String, dynamic> json) => _$CountryWithFlagFromJson(json);

  Map<String, dynamic> toJson() => _$CountryWithFlagToJson(this);
}

