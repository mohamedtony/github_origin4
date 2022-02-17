import 'package:advertisers/app_core/network/models/FilterValuesModel.dart';
import 'package:advertisers/app_core/network/models/FilterValuesModel.dart';
import 'package:json_annotation/json_annotation.dart';
part 'SortTypesModel.g.dart';

@JsonSerializable()
class SortTypesModel {


  String? title;
  FilterValuesModel? values;


  SortTypesModel({
    this.title,this.values,
  });

  factory SortTypesModel.fromJson(Map<String, dynamic> json) => _$SortTypesModelFromJson(json);

  Map<String, dynamic> toJson() => _$SortTypesModelToJson(this);
}

