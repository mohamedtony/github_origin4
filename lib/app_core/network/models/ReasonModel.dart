import 'package:json_annotation/json_annotation.dart';
part 'ReasonModel.g.dart';

@JsonSerializable()
class ReasonModel {

  int? id;
  String? reason;
  ReasonModel({
    this.reason,this.id,
  });

  factory ReasonModel.fromJson(Map<String, dynamic> json) => _$ReasonModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReasonModelToJson(this);
}

