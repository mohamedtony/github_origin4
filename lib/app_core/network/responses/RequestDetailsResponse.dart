import 'package:advertisers/app_core/network/models/RequestDetailsModel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'RequestDetailsResponse.g.dart';

@JsonSerializable()
class RequestDetailsResponse {
  int? status;
  String? message;
  RequestDetailsModel? data;


  RequestDetailsResponse({
    this.status,
    this.message,
    this.data,
  });

  factory RequestDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$RequestDetailsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RequestDetailsResponseToJson(this);
}
