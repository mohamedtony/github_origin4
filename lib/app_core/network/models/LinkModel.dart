import 'package:json_annotation/json_annotation.dart';
part 'LinkModel.g.dart';

@JsonSerializable()
class LinkModel {
  String? title;
  String? link;

  LinkModel({
    this.title,
    this.link,
  });

  factory LinkModel.fromJson(Map<String, dynamic> json) => _$LinkModelFromJson(json);

  Map<String, dynamic> toJson() => _$LinkModelToJson(this);
}

