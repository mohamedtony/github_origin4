import 'package:json_annotation/json_annotation.dart';
part 'LinkModel.g.dart';

@JsonSerializable()
class LinkModel {
  int? id;
  int? ads_id;
  String? name;
  String? link;

  LinkModel({
    this.id,
    this.ads_id,
    this.name,
    this.link,
  });

  factory LinkModel.fromJson(Map<String, dynamic> json) => _$LinkModelFromJson(json);

  Map<String, dynamic> toJson() => _$LinkModelToJson(this);
}

