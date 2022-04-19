import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:json_annotation/json_annotation.dart';

part 'GetAdvertisersModel.g.dart';

@JsonSerializable()
class GetAdvertisersModel {
  int? id;
  String? username;
  String? image;
  bool? chat;
  int? in_blacklist;
  bool? is_liked;
  bool? is_muted;
  var isLikedObs = false.obs;
  var iisMutedObs = false.obs;
  var isInBlackList = 0.obs;
  GetAdvertisersModel({this.id, this.username, this.image,this.chat,this.in_blacklist,this.is_liked,this.is_muted});

  factory GetAdvertisersModel.fromJson(Map<String, dynamic> json) => _$GetAdvertisersModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetAdvertisersModelToJson(this);
}

