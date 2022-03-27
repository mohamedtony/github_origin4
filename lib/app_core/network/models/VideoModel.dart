import 'package:advertisers/app_core/network/models/ProfileAdvertiserStopSettings.dart';
import 'package:advertisers/app_core/network/models/ReasonModel.dart';
import 'package:json_annotation/json_annotation.dart';
part 'VideoModel.g.dart';

@JsonSerializable()
class VideoModel {

  int? id;
  String? name;
  String? url;

  VideoModel({
    this.name,
    this.url,this.id,

  });

  factory VideoModel.fromJson(Map<String, dynamic> json) => _$VideoModelFromJson(json);

  Map<String, dynamic> toJson() => _$VideoModelToJson(this);
}

