
import 'package:json_annotation/json_annotation.dart';

part 'GetGallaryRequest.g.dart';
@JsonSerializable()
class GetGallaryRequest {
  String? filters;
  String?user_id;
  String?categories;
  int?page;

  GetGallaryRequest({this.categories,this.filters, this.user_id,this.page});

  factory GetGallaryRequest.fromJson(Map<String, dynamic> json) =>
      _$GetGallaryRequestFromJson(json);

  Map<String, dynamic> toJson() => _$GetGallaryRequestToJson(this);
}