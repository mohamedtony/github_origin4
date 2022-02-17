// import 'package:advertisers/shared/network/models/Area.dart';
// import 'package:advertisers/shared/network/models/Country.dart';
// import 'package:advertisers/shared/network/models/SubscriptionBaka.dart';
import 'package:advertisers/app_core/network/models/SubscriptionBaka.dart';
import 'package:advertisers/app_core/network/models/TaxSettingsModel.dart';
import 'package:advertisers/app_core/network/models/TypeOfChannelModel.dart';
import 'package:json_annotation/json_annotation.dart';
part 'TypeOfChannelResponse.g.dart';

@JsonSerializable()
class TypeOfChannelResponse {
  int? status;
  String? message;
  TypeOfChannelModel? data;

  TypeOfChannelResponse({
    this.status,
    this.message,
    this.data,
  });

  factory TypeOfChannelResponse.fromJson(Map<String, dynamic> json) =>
      _$TypeOfChannelResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TypeOfChannelResponseToJson(this);
}

