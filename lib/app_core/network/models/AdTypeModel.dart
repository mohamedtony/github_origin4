import 'package:json_annotation/json_annotation.dart';
part 'AdTypeModel.g.dart';

@JsonSerializable()
class AdTypeModel {
  int? id;
  String? name;

  AdTypeModel({this.id,this.name});
  String itemAsStringByName() {
    return this.name!;
  }
  factory AdTypeModel.fromJson(Map<String, dynamic> json) => _$AdTypeModelFromJson(json);

  Map<String, dynamic> toJson() => _$AdTypeModelToJson(this);
}


