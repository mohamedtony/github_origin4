
import 'dart:io';

class FileModel {
  int?id;
  File? file;
  String? link;
  bool? isVideo;
  String? urlVideoLink;
  String? videoId;
  String? type;
  FileModel({
    this.link,
    this.file,
    this.isVideo,
    this.urlVideoLink,
    this.videoId,
    this.type,
    this.id
  });
}

