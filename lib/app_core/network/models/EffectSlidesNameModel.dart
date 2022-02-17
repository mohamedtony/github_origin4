
import 'package:json_annotation/json_annotation.dart';

part 'EffectSlidesNameModel.g.dart';

@JsonSerializable()
class EffectSlidesNameModel {
  String? ar;
  String? en;


  EffectSlidesNameModel({this.ar, this.en,});

  factory EffectSlidesNameModel.fromJson(Map<String, dynamic> json) => _$EffectSlidesNameModelFromJson(json);

  Map<String, dynamic> toJson() => _$EffectSlidesNameModelToJson(this);
}


