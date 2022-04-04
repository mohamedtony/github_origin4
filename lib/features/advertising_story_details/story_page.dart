import 'package:advertisers/features/advertising_story_details/story_model.dart';
import 'package:advertisers/features/advertising_story_details/user_model.dart';
import 'package:advertisers/features/home_page/app_colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:video_player/video_player.dart';

class StoryScreen extends StatefulWidget {
  final List<Story> stories;

  const StoryScreen({required this.stories});

  @override
  _StoryScreenState createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen>
    with SingleTickerProviderStateMixin {
  PageController? _pageController;
  AnimationController? _animController;
  VideoPlayerController? _videoController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _animController = AnimationController(vsync: this);

    final Story firstStory = widget.stories.first;
    _loadStory(story: firstStory, animateToPage: false);

    _animController?.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animController?.stop();
        _animController?.reset();
        setState(() {
          if (_currentIndex + 1 < widget.stories.length) {
            _currentIndex += 1;
            _loadStory(story: widget.stories[_currentIndex]);
          } else {
            // Out of bounds - loop story
            // You can also Navigator.of(context).pop() here
            //_currentIndex = 0;
            // _loadStory(story: widget.stories[_currentIndex]);
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController?.dispose();
    _animController?.dispose();
    _videoController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Story story = widget.stories[_currentIndex];
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTapDown: (details) => _onTapDown(details, story),
        child: Stack(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 100),
              child: PageView.builder(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: widget.stories.length,
                itemBuilder: (context, i) {
                  final Story story = widget.stories[i];
                  if(story.media == MediaType.image){
                    return CachedNetworkImage(
                      imageUrl: story.url,
                      fit: BoxFit.cover,
                    );
                  }else if(story.media == MediaType.video){
                    if (_videoController?.value != null &&
                        _videoController!.value.isInitialized) {
                      return FittedBox(
                        fit: BoxFit.cover,
                        child: SizedBox(
                          width: _videoController!.value.size.width,
                          height: _videoController!.value.size.height,
                          child: VideoPlayer(_videoController!),
                        ),
                      );
                    }
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
            Positioned(
              top: 40.0,
              left: 2.0,
              right: 2.0,
              child: Column(
                children: <Widget>[
                  Row(
                    textDirection: TextDirection.ltr,
                    children: widget.stories
                        .asMap()
                        .map((i, e) {
                      return MapEntry(
                        i,
                        AnimatedBar(
                          animController: _animController!,
                          position: i,
                          currentIndex: _currentIndex,
                        ),
                      );
                    })
                        .values
                        .toList(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 1.5,
                      vertical: 4.0,
                    ),
                    child: UserInfo(user: story.user),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 130,
                padding: EdgeInsets.only(top: 6),
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Container(
                              width: 40.0,
                              height: 40.0,
                              decoration: new BoxDecoration(
                                color: Colors.grey[300],
                                shape: BoxShape.circle,
                              ),
                              child: Align(
                                  alignment: Alignment.center,
                                  child:Image.asset(
                                    'images/comments3.png',
                                    height: 25,
                                    width: 30,
                                    fit: BoxFit.fill,
                                    //color: Colors.white,
                                  ),),
                            ),
                            Text("تعليق",style: TextStyle(color: Color(0xff4286D2)),)
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              width: 40.0,
                              height: 40.0,
                              padding: EdgeInsets.all(13),
                              decoration: new BoxDecoration(
                                color: Colors.grey[300],
                                shape: BoxShape.circle,
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child:Image.asset(
                                  'images/icon_share2.png',
                                  height: 25,
                                  width: 30,
                                  fit: BoxFit.fill,
                                  //color: Colors.white,
                                ),),
                            ),
                            Text("مشاركة",style: TextStyle(color: Color(0xff4286D2)),)
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              width: 40.0,
                              height: 40.0,
                              padding: EdgeInsets.all(13),
                              decoration: new BoxDecoration(
                                color: Colors.grey[300],
                                shape: BoxShape.circle,
                              ),
                              child: Image.asset(
                                'images/heartsolid3x.png',
                                height: 25,
                                width: 30,
                                fit: BoxFit.fill,
                                //color: Colors.white,
                              ),
                            ),
                            Text("مفضلة",style: TextStyle(color: Color(0xff4286D2)),)
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              width: 40.0,
                              height: 40.0,
                              padding: EdgeInsets.only(bottom: 14,top: 8,left: 12,right: 12),
                              decoration: new BoxDecoration(
                                color: Colors.grey[300],
                                shape: BoxShape.circle,
                              ),
                              child: Image.asset(
                                'images/like_story.png',
                                height: 25,
                                width: 30,
                                fit: BoxFit.fill,
                                //color: Colors.white,
                              ),
                            ),
                            Text("96",style: TextStyle(color: Color(0xff4286D2)),)
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              width: 40.0,
                              height: 40.0,
                              padding: EdgeInsets.all(13),
                              decoration: new BoxDecoration(
                                color: Colors.grey[300],
                                shape: BoxShape.circle,
                              ),
                              child: Image.asset(
                                'images/icon_dislike3.png',
                                height: 25,
                                width: 30,
                                fit: BoxFit.fill,
                                //color: Colors.white,
                              ),
                            ),
                            Text("96",style: TextStyle(color: Color(0xff4286D2)),)
                          ],
                        ),
                      ],
                    ),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: Container(
                            // width: 50.0,
                            height: 44.0,
                            margin: EdgeInsets.all(6.0),
                            decoration: new BoxDecoration(
                                color: Colors.grey[200],
                                shape: BoxShape.rectangle,
                                borderRadius: new BorderRadius.all(
                                  Radius.circular(40.0),
                                )
                            ),
                            child:  Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  width: 50.0,
                                  height: 50.0,
                                 /* decoration: new BoxDecoration(
                                    color: Colors.grey[300],
                                    shape: BoxShape.circle,
                                  ),*/
                                  child: Align(
                                    alignment: Alignment.center,
                                    child:Image.asset(
                                      'images/minutemailer2x.png',
                                      height: 25,
                                      width: 30,
                                      fit: BoxFit.fill,
                                      //color: Colors.white,
                                    ),),
                                ),
                                VerticalDivider(
                                  thickness: 1.4,
                                  width: 1,
                                  color: Colors.grey,
                                  indent: 10,
                                  endIndent: 10,
                                ),
                                Expanded(
                                  child: TextField(
                                    textAlign: TextAlign.start,
                                    //focusNode: requestAdvertiseController.coponNumberNode,
                                    textAlignVertical: TextAlignVertical.center,
                                    //keyboardType:TextInputType.number,
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.only(
                                          left: 10.0,
                                          right: 10.0,
                                        ),
                                        // isCollapsed: true,
                                        border: OutlineInputBorder(
                                         borderRadius: BorderRadius.only(topLeft: Radius.circular(40),bottomLeft: Radius.circular(40)),
                                          borderSide: BorderSide(
                                            width: 0,
                                            style: BorderStyle.none,
                                          ),
                                        ),
                                       // filled: true,
                                        hintStyle: TextStyle(color: Colors.grey[500]),
                                        hintText: 'أضف تعليقك الخاص بالمحتوى',
                                        //fillColor: Colors.white70
                                    ),
                                    //controller: requestAdvertiseController.coponNumberController,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onTapDown(TapDownDetails details, Story story) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHieght = MediaQuery.of(context).size.height;

    final double dx = details.globalPosition.dx;
    if(details.globalPosition.dy<screenHieght/2){
      print("screenHieght");

    }
    if (dx < screenWidth / 3) {
      print("screenWidth");
      setState(() {
        if (_currentIndex - 1 >= 0) {
          _currentIndex -= 1;
          _loadStory(story: widget.stories[_currentIndex]);
        }
      });
    } else if (dx > 2 * screenWidth / 3) {
      setState(() {
        if (_currentIndex + 1 < widget.stories.length) {
          _currentIndex += 1;
          _loadStory(story: widget.stories[_currentIndex]);
        } else {
          // Out of bounds - loop story
          // You can also Navigator.of(context).pop() here
          _currentIndex = 0;
          _loadStory(story: widget.stories[_currentIndex]);
        }
      });
    } else {
      if (story.media == MediaType.video) {
        if (_videoController!.value.isPlaying) {
          _videoController?.pause();
          _animController?.stop();
        } else {
          _videoController?.play();
          _animController?.forward();
        }
      }
    }
  }

  void _loadStory({Story? story, bool animateToPage = true}) {
    _animController?.stop();
    _animController?.reset();
    switch (story!.media) {
      case MediaType.image:
        _animController!.duration = story.duration;
        _animController?.forward();
        break;
      case MediaType.video:
        _videoController = null;
        _videoController?.dispose();
        _videoController = VideoPlayerController.network(story.url)
          ..initialize().then((_) {
            setState(() {});
            if (_videoController!.value.isInitialized) {
              _animController!.duration = _videoController!.value.duration;
              _videoController!.play();
              _animController!.forward();
            }
          });
        break;
    }
    if (animateToPage) {
      _pageController?.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 1),
        curve: Curves.easeInOut,
      );
    }
  }
}

class AnimatedBar extends StatelessWidget {
  final AnimationController animController;
  final int position;
  final int currentIndex;

  const AnimatedBar({
    Key? key,
    required this.animController,
    required this.position,
    required this.currentIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 1.5),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              textDirection: TextDirection.ltr,
              children: <Widget>[
                _buildContainer(
                  double.infinity,
                  position < currentIndex
                      ? Colors.white
                      : Colors.white.withOpacity(0.5),
                ),
                position == currentIndex
                    ? AnimatedBuilder(
                  animation: animController,
                  builder: (context, child) {
                    return _buildContainer(
                      constraints.maxWidth * animController.value,
                      Colors.white,
                    );
                  },
                )
                    : const SizedBox.shrink(),
              ],
            );
          },
        ),
      ),
    );
  }

  Container _buildContainer(double width, Color color) {
    return Container(
      height: 3.5,
      width: width,
      decoration: BoxDecoration(
        color: color,
        border: Border.all(
          color: Colors.black26,
          width: 0.8,
        ),
        borderRadius: BorderRadius.circular(3.0),
      ),
    );
  }
}

class UserInfo extends StatelessWidget {
  final User user;

  const UserInfo({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      color: AppColors.saveButtonBottomSheet.withOpacity(.6),
      child: Row(
        children: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.close,
              size: 30.0,
              color: Colors.white,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          const SizedBox(width: 4.0),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Stack(
                      children: [
                        Container(
                          // width: 50.0,
                          height: 30.0,
                          padding: EdgeInsets.only(left: 10,right: 10),
                          margin: EdgeInsets.only(right: 15.0,left: 4,top: 6),
                          decoration: new BoxDecoration(
                              color: Color(0xffCFCFCF),
                              shape: BoxShape.rectangle,
                              borderRadius: new BorderRadius.all(
                                Radius.circular(40.0),
                              )
                          ),
                          child:  Text("تفاصيل الاعلان"),
                        ),
                        Positioned(
                          right: -2,
                          child: Image.asset(
                          'images/story_share.png',
                          height: 25,
                          width: 30,
                          fit: BoxFit.fill,
                          //color: Colors.white,
                        ),)
                      ],
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.only(left: 4.0,right: 4.0),
                        child: Text(
                          "محمدالتونى حماد",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                            overflow: TextOverflow.ellipsis
                          ),
                          maxLines: 1,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "فاعليات مهرجان التمور من الفترة 2020 الى  2021",
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600,
                        overflow: TextOverflow.ellipsis
                    ),
                    maxLines: 2,
                  ),
                ),
              ],
            ),
          ),

          Stack(
            children: [
              CircleAvatar(
                radius: 25.0,
                backgroundColor: Colors.grey[300],
                backgroundImage: CachedNetworkImageProvider(
                  user.profileImageUrl,
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }
}
