import 'package:advertisers/app_core/network/models/AdTypeModel.dart';
import 'package:advertisers/app_core/network/models/Area.dart';
import 'package:advertisers/app_core/network/models/CategoryModel.dart';
import 'package:advertisers/app_core/network/models/Country.dart';
import 'package:advertisers/app_core/network/models/EffectSlidesModel.dart';
import 'package:advertisers/app_core/network/models/SortTypesAdvertisersModel.dart';
import 'package:advertisers/app_core/network/models/SortTypesModel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'GetGallaryRequestFilter.g.dart';
@JsonSerializable()
class GetGallaryRequestFilter {
  Map<String , String>? filters;
  Map<String , String>? users;
  List<CategoryModel>? services;

  GetGallaryRequestFilter({this.filters,this.users,this.services});

  factory GetGallaryRequestFilter.fromJson(Map<String, dynamic> json) => _$GetGallaryRequestFilterFromJson(json);

  Map<String, dynamic> toJson() => _$GetGallaryRequestFilterToJson(this);
}

