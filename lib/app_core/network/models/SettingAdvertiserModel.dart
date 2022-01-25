import 'package:json_annotation/json_annotation.dart';
part 'SettingAdvertiserModel.g.dart';

@JsonSerializable()
class SettingAdvertiserModel {


 String? key,txt;
  int? value;


  SettingAdvertiserModel({
   this.value,this.key,this.txt
  });

  factory SettingAdvertiserModel.fromJson(Map<String, dynamic> json) => _$SettingAdvertiserModelFromJson(json);

  Map<String, dynamic> toJson() => _$SettingAdvertiserModelToJson(this);
}

