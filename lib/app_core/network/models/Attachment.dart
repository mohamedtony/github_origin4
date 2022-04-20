import 'package:json_annotation/json_annotation.dart';


part 'Attachment.g.dart';

@JsonSerializable()
class Attachment {
  int? id;
  int? ads_id;
  String? path;
  String? created_at;
  String? updated_at;
  String? type;
  String?video_id;


  Attachment({this.id, this.ads_id, this.path,this.created_at,this.updated_at,this.type,this.video_id});

  factory Attachment.fromJson(Map<String, dynamic> json) => _$AttachmentFromJson(json);

  Map<String, dynamic> toJson() => _$AttachmentToJson(this);
}

