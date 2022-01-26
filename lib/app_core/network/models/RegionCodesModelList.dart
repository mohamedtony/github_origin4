import 'package:advertisers/app_core/network/models/RegionCodesModel.dart';
import 'package:json_annotation/json_annotation.dart';
part 'RegionCodesModelList.g.dart';

@JsonSerializable()
class RegionCodesModelList {

  List<RegionCodesModel>? codes;

  RegionCodesModelList({
    this.codes
  });

  factory RegionCodesModelList.fromJson(Map<String, dynamic> json) => _$RegionCodesModelListFromJson(json);

  Map<String, dynamic> toJson() => _$RegionCodesModelListToJson(this);
}

