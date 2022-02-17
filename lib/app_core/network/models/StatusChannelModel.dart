import 'package:json_annotation/json_annotation.dart';
part 'StatusChannelModel.g.dart';

@JsonSerializable()
class StatusChannelModel {
  int? status;
  StatusChannelModel({
    this.status
  });

  factory StatusChannelModel.fromJson(Map<String, dynamic> json) => _$StatusChannelModelFromJson(json);

  Map<String, dynamic> toJson() => _$StatusChannelModelToJson(this);
}

