import 'package:json_annotation/json_annotation.dart';

part 'SelectCoponsRequest.g.dart';

@JsonSerializable()
class SelectCoponsRequest {

   List<int>?copons;


  SelectCoponsRequest({this.copons});

  factory SelectCoponsRequest.fromJson(Map<String, dynamic> json) =>
      _$SelectCoponsRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SelectCoponsRequestToJson(this);
}