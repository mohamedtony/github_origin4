import 'package:json_annotation/json_annotation.dart';
part 'FilterValuesModel.g.dart';

@JsonSerializable()
class FilterValuesModel {
  String? latest,oldest,pending_payment,pending_confirm,rejected,inprogress,cancelled;

  FilterValuesModel({
    this.latest,this.cancelled,this.inprogress,this.oldest,
    this.pending_confirm,this.pending_payment,this.rejected
  });

  factory FilterValuesModel.fromJson(Map<String, dynamic> json) => _$FilterValuesModelFromJson(json);

  Map<String, dynamic> toJson() => _$FilterValuesModelToJson(this);
}

