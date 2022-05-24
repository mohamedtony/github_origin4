import 'package:advertisers/app_core/network/models/AdTypeModel.dart';
import 'package:advertisers/app_core/network/models/Area.dart';
import 'package:advertisers/app_core/network/models/CategoryModel.dart';
import 'package:advertisers/app_core/network/models/Country.dart';
import 'package:advertisers/app_core/network/models/EffectSlidesModel.dart';
import 'package:advertisers/app_core/network/models/SortTypesAdvertisersModel.dart';
import 'package:advertisers/app_core/network/models/SortTypesModel.dart';
import 'package:json_annotation/json_annotation.dart';

import 'Channel.dart';

part 'GetAdsFilterForm.g.dart';

@JsonSerializable()
class GetAdsFilterForm {
  Map<String , String>? filters;
  List<AdTypeModel>? types;
  List<Area>? areas;
  List<Country>? countries;

  GetAdsFilterForm({this.filters,this.types, this.areas, this.countries});

  factory GetAdsFilterForm.fromJson(Map<String, dynamic> json) => _$GetAdsFilterFormFromJson(json);

  Map<String, dynamic> toJson() => _$GetAdsFilterFormToJson(this);
}

