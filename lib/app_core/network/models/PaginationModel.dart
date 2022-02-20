import 'package:json_annotation/json_annotation.dart';
part 'PaginationModel.g.dart';

@JsonSerializable()
class PaginationModel {

 int? current_page;
 String? first_page_url;
int? from;
int? last_page;
 String? last_page_url;
 String? next_page_url;
 String? path;
int? per_page;
String? prev_page_url;
int? to;
 int? total;

 PaginationModel({
    this.current_page,this.first_page_url,this.from,this.last_page,this.last_page_url,
   this.next_page_url,this.path,this.per_page,this.prev_page_url,this.to,this.total
  });

  factory PaginationModel.fromJson(Map<String, dynamic> json) => _$PaginationModelFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationModelToJson(this);
}

