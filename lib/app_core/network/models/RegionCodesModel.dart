import 'package:json_annotation/json_annotation.dart';
part 'RegionCodesModel.g.dart';

@JsonSerializable()
class RegionCodesModel {

  String? name,dial_code,code;

  RegionCodesModel({
    this.name,this.dial_code,this.code
  });

  factory RegionCodesModel.fromJson(Map<String, dynamic> json) => _$RegionCodesModelFromJson(json);

  Map<String, dynamic> toJson() => _$RegionCodesModelToJson(this);
}

