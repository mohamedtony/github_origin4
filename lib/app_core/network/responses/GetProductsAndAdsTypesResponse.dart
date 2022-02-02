import 'package:advertisers/app_core/network/models/CategoryModel.dart';
import 'package:advertisers/app_core/network/models/Channel.dart';
import 'package:advertisers/app_core/network/models/ClientProfileModel.dart';
import 'package:advertisers/app_core/network/models/ProductsAndAdsTypesModel.dart';
import 'package:advertisers/app_core/network/models/ProfileAdvertiserStopSettingsData.dart';
import 'package:json_annotation/json_annotation.dart';

part 'GetProductsAndAdsTypesResponse.g.dart';

@JsonSerializable()
class GetProductsAndAdsTypesResponse {
  int? status;
  String? message;
  ProductsAndAdsTypesModel? data;



  GetProductsAndAdsTypesResponse({
    this.status,
    this.message,
    this.data,
  });

  factory GetProductsAndAdsTypesResponse.fromJson(Map<String, dynamic> json) =>
      _$GetProductsAndAdsTypesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetProductsAndAdsTypesResponseToJson(this);
}
