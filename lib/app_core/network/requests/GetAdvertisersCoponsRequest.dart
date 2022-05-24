import 'package:json_annotation/json_annotation.dart';

part 'GetAdvertisersCoponsRequest.g.dart';
@JsonSerializable()
class GetAdvertisersCoponsRequest {
  String? filters;
  String? store_name;
  int? page;
  String? users;

  GetAdvertisersCoponsRequest({this.filters,this.store_name,this.page,this.users});

  factory GetAdvertisersCoponsRequest.fromJson(Map<String, dynamic> json) =>
      _$GetAdvertisersCoponsRequestFromJson(json);

  Map<String, dynamic> toJson() => _$GetAdvertisersCoponsRequestToJson(this);
}