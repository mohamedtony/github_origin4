import 'package:json_annotation/json_annotation.dart';
part 'AddToFavoriteListModel.g.dart';

@JsonSerializable()
class AddToFavoriteListModel{
  int? liked;
  int? in_blacklist;
  int?is_liked;
  int?is_muted;
  int? in_front;
  int? notified;
AddToFavoriteListModel({this.liked,this.in_blacklist,this.is_liked,this.is_muted,this.in_front,this.notified});

  factory AddToFavoriteListModel.fromJson(Map<String, dynamic> json) => _$AddToFavoriteListModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddToFavoriteListModelToJson(this);
}

