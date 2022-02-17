import 'package:json_annotation/json_annotation.dart';
part 'TypeOfChannelModel.g.dart';

@JsonSerializable()
class TypeOfChannelModel {
  String? type;
  TypeOfChannelModel({
    this.type
  });

  factory TypeOfChannelModel.fromJson(Map<String, dynamic> json) => _$TypeOfChannelModelFromJson(json);

  Map<String, dynamic> toJson() => _$TypeOfChannelModelToJson(this);
}

