import 'package:json_annotation/json_annotation.dart';
part 'LocationModel.g.dart';

@JsonSerializable()
class LocationModel {

  String? name;
  String? address;
  double? lat;
  double? lng;

  LocationModel({
    this.name,
    this.address,
    this.lat,
    this.lng
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) => _$LocationModelFromJson(json);

  Map<String, dynamic> toJson() => _$LocationModelToJson(this);
}

