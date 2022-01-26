import 'package:json_annotation/json_annotation.dart';
part 'AddRemoveBlackListModel.g.dart';

@JsonSerializable()
class AddRemoveBlackListModel {
  int? in_blacklist;

  AddRemoveBlackListModel({this.in_blacklist});

  factory AddRemoveBlackListModel.fromJson(Map<String, dynamic> json) => _$AddRemoveBlackListModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddRemoveBlackListModelToJson(this);
}

