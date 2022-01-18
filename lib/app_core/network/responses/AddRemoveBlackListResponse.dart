import 'package:advertisers/app_core/network/models/AddRemoveBlackListModel.dart';
import 'package:json_annotation/json_annotation.dart';
part 'AddRemoveBlackListResponse.g.dart';

@JsonSerializable()
class AddRemoveBlackListResponse {
  int? status;
  String? message;
  AddRemoveBlackListModel? data;

  AddRemoveBlackListResponse({
    this.status,
    this.message,
    this.data,
  });

  factory AddRemoveBlackListResponse.fromJson(Map<String, dynamic> json) =>
      _$AddRemoveBlackListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AddRemoveBlackListResponseToJson(this);
}

