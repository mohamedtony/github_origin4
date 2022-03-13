import 'package:json_annotation/json_annotation.dart';
part 'StatusesModel.g.dart';

@JsonSerializable()
class StatusesModel {
 bool? payment;
 bool? reject;
 bool? transfer;
 bool? confirm;
 bool? confirm_pricing;
 bool? edit;
 bool? cancel;
 StatusesModel({
    this.payment,this.cancel,this.confirm,this.edit,this.reject,this.transfer,this.confirm_pricing
  });

  factory StatusesModel.fromJson(Map<String, dynamic> json) => _$StatusesModelFromJson(json);

  Map<String, dynamic> toJson() => _$StatusesModelToJson(this);
}

