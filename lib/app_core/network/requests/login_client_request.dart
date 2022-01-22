
import 'package:json_annotation/json_annotation.dart';
part 'login_client_request.g.dart';
@JsonSerializable()
class LoginClientRequest {
  String? phone,password   ;



  LoginClientRequest({this.phone,this.password});

  factory LoginClientRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginClientRequestFromJson(json);

  Map<String, dynamic> toJson() => _$LoginClientRequestToJson(this);
}