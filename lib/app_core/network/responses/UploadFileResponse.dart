// import 'package:advertisers/shared/network/models/Area.dart';
// import 'package:advertisers/shared/network/models/Country.dart';
// import 'package:advertisers/shared/network/models/SubscriptionBaka.dart';
import 'package:advertisers/app_core/network/models/SubscriptionBaka.dart';
import 'package:advertisers/app_core/network/models/TaxSettingsModel.dart';
import 'package:advertisers/app_core/network/models/UploadFileModel.dart';
import 'package:json_annotation/json_annotation.dart';
part 'UploadFileResponse.g.dart';

@JsonSerializable()
class UploadFileResponse {
  int? status;
  String? message;
  UploadFileModel? data;

  UploadFileResponse({
    this.status,
    this.message,
    this.data,
  });

  factory UploadFileResponse.fromJson(Map<String, dynamic> json) =>
      _$UploadFileResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UploadFileResponseToJson(this);
}

