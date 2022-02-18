import 'package:advertisers/app_core/network/models/PaginationModel.dart';
import 'package:advertisers/app_core/network/models/RequestModel.dart';
import 'package:advertisers/app_core/network/models/SortTypesModel.dart';
import 'package:json_annotation/json_annotation.dart';
part 'RequestModelData.g.dart';

@JsonSerializable()
class RequestModelData {

  List<SortTypesModel>? sort_types;
  List<RequestModel>? requests;
  PaginationModel? pagination;
  RequestModelData({
    this.requests,this.sort_types,this.pagination
  });

  factory RequestModelData.fromJson(Map<String, dynamic> json) => _$RequestModelDataFromJson(json);

  Map<String, dynamic> toJson() => _$RequestModelDataToJson(this);
}

