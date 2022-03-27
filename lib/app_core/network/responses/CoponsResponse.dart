import 'package:advertisers/app_core/network/models/AddRemoveBlackListModel.dart';

import 'package:advertisers/app_core/network/models/ChannelData.dart';
import 'package:advertisers/app_core/network/models/CoponModelResponse.dart';
import 'package:json_annotation/json_annotation.dart';
part 'CoponsResponse.g.dart';

@JsonSerializable()
class CoponsResponse {
  int? status;
  String? message;
  List<CoponModelResponse>? data;

  CoponsResponse({
    this.status,
    this.message,
    this.data,
  });

  factory CoponsResponse.fromJson(Map<String, dynamic> json) =>
      _$CoponsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CoponsResponseToJson(this);
}

