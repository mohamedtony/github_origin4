import 'package:advertisers/app_core/network/models/Country.dart';
import 'package:advertisers/app_core/network/models/MyRequestsFiltersModel.dart';
import 'package:advertisers/app_core/network/models/MyRequestsSortsModel.dart';
import 'package:json_annotation/json_annotation.dart';
part 'GetMyRequestsFilterForm.g.dart';
@JsonSerializable()
class GetMyRequestsFilterForm {
  Map<String , String>? filters;
  Map<String , String>? sorts;
  List<Country>? countries;

  GetMyRequestsFilterForm({this.filters,this.sorts,});

  factory GetMyRequestsFilterForm.fromJson(Map<String, dynamic> json) => _$GetMyRequestsFilterFormFromJson(json);

  Map<String, dynamic> toJson() => _$GetMyRequestsFilterFormToJson(this);
}

