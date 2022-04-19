import 'package:advertisers/app_core/network/models/FilterValuesModel.dart';
import 'package:advertisers/app_core/network/models/FilterValuesModel.dart';
import 'package:json_annotation/json_annotation.dart';
part 'StarModel.g.dart';

@JsonSerializable()
class StarModel {


  int? starred;


  StarModel({
    this.starred,
  });

  factory StarModel.fromJson(Map<String, dynamic> json) => _$StarModelFromJson(json);

  Map<String, dynamic> toJson() => _$StarModelToJson(this);
}

