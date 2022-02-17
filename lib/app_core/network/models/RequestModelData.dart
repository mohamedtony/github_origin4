import 'package:advertisers/app_core/network/models/RequestModel.dart';
import 'package:advertisers/app_core/network/models/SortTypesModel.dart';
import 'package:json_annotation/json_annotation.dart';
part 'RequestModelData.g.dart';

@JsonSerializable()
class RequestModelData {

  List<SortTypesModel>? sort_types;
  List<RequestModel>? requests;
  RequestModelData({
    this.requests,this.sort_types,
  });

  factory RequestModelData.fromJson(Map<String, dynamic> json) => _$RequestModelDataFromJson(json);

  Map<String, dynamic> toJson() => _$RequestModelDataToJson(this);
}

