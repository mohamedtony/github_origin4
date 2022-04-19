import 'package:advertisers/app_core/network/models/AddRemoveBlackListModel.dart';
import 'package:advertisers/app_core/network/models/AddToFavoriteListModel.dart';
import 'package:json_annotation/json_annotation.dart';
part 'AddToFavoriteListResponse.g.dart';

@JsonSerializable()
class AddToFavoriteListResponse {
  int? status;
  String? message;
  AddToFavoriteListModel? data;

  AddToFavoriteListResponse({
    this.status,
    this.message,
    this.data,
  });

  factory AddToFavoriteListResponse.fromJson(Map<String, dynamic> json) =>
      _$AddToFavoriteListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AddToFavoriteListResponseToJson(this);
}

