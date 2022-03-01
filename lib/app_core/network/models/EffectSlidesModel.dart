import 'package:advertisers/app_core/network/models/EffectSlidesNameModel.dart';
import 'package:json_annotation/json_annotation.dart';
part 'EffectSlidesModel.g.dart';

@JsonSerializable()
class EffectSlidesModel {
  int? id;
  String? name;
  int? count_from;
  int? count_to;

  String itemAsString(){
    if(id==-1){
      return "إختر";
    }
    return '${count_to}'+' - '+'${count_from}';
  }
  EffectSlidesModel({this.id, this.name, this.count_from,this.count_to});

  factory EffectSlidesModel.fromJson(Map<String, dynamic> json) => _$EffectSlidesModelFromJson(json);

  Map<String, dynamic> toJson() => _$EffectSlidesModelToJson(this);
}


