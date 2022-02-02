import 'package:advertisers/app_core/network/models/AddRemoveBlackListModel.dart';

import 'package:advertisers/app_core/network/models/ChannelData.dart';
import 'package:advertisers/app_core/network/models/CheckPhoneModel.dart';
import 'package:json_annotation/json_annotation.dart';
part 'CheckPhoneResponse.g.dart';

@JsonSerializable()
class CheckPhoneResponse {
  int? status;
  String? message;
  CheckPhoneModel? data;

  CheckPhoneResponse({
    this.status,
    this.message,
    this.data,
  });

  factory CheckPhoneResponse.fromJson(Map<String, dynamic> json) =>
      _$CheckPhoneResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CheckPhoneResponseToJson(this);
}

