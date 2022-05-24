import 'package:advertisers/app_core/network/models/AdTypeModel.dart';
import 'package:advertisers/app_core/network/models/Area.dart';
import 'package:advertisers/app_core/network/models/CategoryModel.dart';
import 'package:advertisers/app_core/network/models/Country.dart';
import 'package:advertisers/app_core/network/models/EffectSlidesModel.dart';
import 'package:advertisers/app_core/network/models/GetCouponsFilterModel.dart';
import 'package:advertisers/app_core/network/models/SortTypesAdvertisersModel.dart';
import 'package:advertisers/app_core/network/models/SortTypesModel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'GetCouponsFilterFormResponse.g.dart';


@JsonSerializable()
class GetCouponsFilterFormResponse {
  int?status;
  String? message;
  GetCouponsFilterModel? data;

  GetCouponsFilterFormResponse({this.status,this.message,this.data});

  factory GetCouponsFilterFormResponse.fromJson(Map<String, dynamic> json) => _$GetCouponsFilterFormResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetCouponsFilterFormResponseToJson(this);
}

