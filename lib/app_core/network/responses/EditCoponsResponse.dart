import 'package:advertisers/app_core/network/models/AddRemoveBlackListModel.dart';

import 'package:advertisers/app_core/network/models/ChannelData.dart';
import 'package:advertisers/app_core/network/models/CoponModelResponse.dart';
import 'package:json_annotation/json_annotation.dart';
part 'EditCoponsResponse.g.dart';

@JsonSerializable()
class EditCoponsResponse {
  int? status;
  String? message;
  CoponModelResponse? data;

  EditCoponsResponse({
    this.status,
    this.message,
    this.data,
  });

  factory EditCoponsResponse.fromJson(Map<String, dynamic> json) =>
      _$EditCoponsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$EditCoponsResponseToJson(this);
}

