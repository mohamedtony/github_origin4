import 'package:advertisers/app_core/network/models/EffectSlidesNameModel.dart';
import 'package:json_annotation/json_annotation.dart';
part 'EffectSlidesModel.g.dart';

@JsonSerializable()
class EffectSlidesModel {
  int? id;
  EffectSlidesNameModel? name;


  EffectSlidesModel({this.id, this.name, });

  factory EffectSlidesModel.fromJson(Map<String, dynamic> json) => _$EffectSlidesModelFromJson(json);

  Map<String, dynamic> toJson() => _$EffectSlidesModelToJson(this);
}


