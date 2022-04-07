import 'package:advertisers/features/advertising_story_details/User.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';



part 'Story.g.dart';

@JsonSerializable()
class Story {
   String? url;
   MediaType? media;
   Duration? duration;
   User? user;

   Story({
     this.url,
     this.media,
     this.duration,
     this.user,
  });
   factory Story.fromJson(Map<String, dynamic> json) => _$StoryFromJson(json);

   Map<String, dynamic> toJson() => _$StoryToJson(this);
}
enum MediaType {
  image,
  video,
  audio
}