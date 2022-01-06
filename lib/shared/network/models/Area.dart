
import 'package:json_annotation/json_annotation.dart';


part 'Area.g.dart';

@JsonSerializable()
class Area {
  int? id;
  int? country_id;
  String? name;
  String? area_code;


  Area({this.id, this.country_id, this.name,this.area_code});

  factory Area.fromJson(Map<String, dynamic> json) => _$AreaFromJson(json);

  Map<String, dynamic> toJson() => _$AreaToJson(this);
}

