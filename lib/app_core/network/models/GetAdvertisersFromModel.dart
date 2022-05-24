import 'package:advertisers/app_core/network/models/CategoryModel.dart';
import 'package:advertisers/app_core/network/models/Country.dart';
import 'package:advertisers/app_core/network/models/EffectSlidesModel.dart';
import 'package:advertisers/app_core/network/models/SortTypesAdvertisersModel.dart';
import 'package:advertisers/app_core/network/models/SortTypesModel.dart';
import 'package:json_annotation/json_annotation.dart';

import 'Channel.dart';

part 'GetAdvertisersFromModel.g.dart';

@JsonSerializable()
class GetAdvertisersFromModel {
  Map<String,String>? sort_types;
  List<CategoryModel>? categories;
  List<EffectSlidesModel>? effect_slides;
  List<Country>? countries;
  List<Channel>? channels;



  GetAdvertisersFromModel({this.sort_types, this.categories, this.countries,this.effect_slides,this.channels});

  factory GetAdvertisersFromModel.fromJson(Map<String, dynamic> json) => _$GetAdvertisersFromModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetAdvertisersFromModelToJson(this);
}

