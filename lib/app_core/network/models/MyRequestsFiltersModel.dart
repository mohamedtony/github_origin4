import 'package:advertisers/app_core/network/models/User.dart';
import 'package:json_annotation/json_annotation.dart';
part 'MyRequestsFiltersModel.g.dart';

@JsonSerializable()
class MyRequestsFiltersModel {
  String? pending_pricing;
  String? pending_payment;
  String? rejected;
  String? pending_execution;
  String? inprogress;
  String? pending_cofirm;
  String? cancelled;



  MyRequestsFiltersModel({this.pending_cofirm,this.pending_execution, this.rejected, this.inprogress,this.cancelled,this.pending_payment,this.pending_pricing});

  factory MyRequestsFiltersModel.fromJson(Map<String, dynamic> json) => _$MyRequestsFiltersModelFromJson(json);

  Map<String, dynamic> toJson() => _$MyRequestsFiltersModelToJson(this);
}

