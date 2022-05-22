import 'package:advertisers/app_core/network/models/AdTypeModel.dart';
import 'package:advertisers/app_core/network/models/Area.dart';
import 'package:advertisers/app_core/network/models/CategoryModel.dart';
import 'package:advertisers/app_core/network/models/Country.dart';
import 'package:advertisers/app_core/network/models/EffectSlidesModel.dart';
import 'package:advertisers/app_core/network/models/SortTypesAdvertisersModel.dart';
import 'package:advertisers/app_core/network/models/SortTypesModel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'GetCouponsFilterModel.g.dart';


@JsonSerializable()
class GetCouponsFilterModel {

  Map<String , String>? filters;
  List<String>? stores;

  GetCouponsFilterModel({this.filters,this.stores,});

  factory GetCouponsFilterModel.fromJson(Map<String, dynamic> json) => _$GetCouponsFilterModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetCouponsFilterModelToJson(this);
}

