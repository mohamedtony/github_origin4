// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'GetProductsAndAdsTypesResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetProductsAndAdsTypesResponse _$GetProductsAndAdsTypesResponseFromJson(
        Map<String, dynamic> json) =>
    GetProductsAndAdsTypesResponse(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : ProductsAndAdsTypesModel.fromJson(
              json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetProductsAndAdsTypesResponseToJson(
        GetProductsAndAdsTypesResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
