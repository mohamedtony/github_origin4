import 'package:json_annotation/json_annotation.dart';
part 'CreateSuscriptionWithReciet.g.dart';

@JsonSerializable()
class CreateSuscriptionWithReciet {
  String? pdf;

  CreateSuscriptionWithReciet({
    this.pdf,
  });

  factory CreateSuscriptionWithReciet.fromJson(Map<String, dynamic> json) => _$CreateSuscriptionWithRecietFromJson(json);

  Map<String, dynamic> toJson() => _$CreateSuscriptionWithRecietToJson(this);
}

