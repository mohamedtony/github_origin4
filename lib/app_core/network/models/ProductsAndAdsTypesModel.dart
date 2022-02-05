import 'package:advertisers/app_core/network/models/AdTypeModel.dart';
import 'package:advertisers/app_core/network/models/CategoryModel.dart';
import 'package:advertisers/app_core/network/models/Channel.dart';
import 'package:json_annotation/json_annotation.dart';
part 'ProductsAndAdsTypesModel.g.dart';

@JsonSerializable()
class ProductsAndAdsTypesModel {
  List<CategoryModel>? product_types;
  List<AdTypeModel>? ads_types;
  List<Channel>? channels;

  ProductsAndAdsTypesModel({
    this.product_types,
    this.ads_types,
    this.channels,
  });
  factory ProductsAndAdsTypesModel.fromJson(Map<String, dynamic> json) => _$ProductsAndAdsTypesModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductsAndAdsTypesModelToJson(this);
}

