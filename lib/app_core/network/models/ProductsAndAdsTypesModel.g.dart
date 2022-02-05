// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ProductsAndAdsTypesModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductsAndAdsTypesModel _$ProductsAndAdsTypesModelFromJson(
        Map<String, dynamic> json) =>
    ProductsAndAdsTypesModel(
      product_types: (json['product_types'] as List<dynamic>?)
          ?.map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      ads_types: (json['ads_types'] as List<dynamic>?)
          ?.map((e) => AdTypeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      channels: (json['channels'] as List<dynamic>?)
          ?.map((e) => Channel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductsAndAdsTypesModelToJson(
        ProductsAndAdsTypesModel instance) =>
    <String, dynamic>{
      'product_types': instance.product_types,
      'ads_types': instance.ads_types,
      'channels': instance.channels,
    };
