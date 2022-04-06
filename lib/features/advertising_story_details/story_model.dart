import 'package:advertisers/features/advertising_story_details/user_model.dart';
import 'package:meta/meta.dart';


enum MediaType {
  image,
  video,
  audio
}

class Story {
  final String url;
  final MediaType media;
  final Duration duration;
  final User user;

  const Story({
    required this.url,
    required this.media,
    required this.duration,
    required this.user,
  });
}
