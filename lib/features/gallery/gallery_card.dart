import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:get/get.dart';
import 'package:quds_popup_menu/quds_popup_menu.dart';
import 'package:video_player/video_player.dart';

class GalleryCard extends StatefulWidget {
  const GalleryCard({ this.url, Key? key}) : super(key: key);
  final String?  url;
  @override
  State<GalleryCard> createState() => _GalleryCardState();
}

class _GalleryCardState extends State<GalleryCard> {
  late VideoPlayerController _controller;
  late bool visible;

  @override
  void initState() {
    visible = false;
    super.initState();
    _controller = VideoPlayerController.network(widget.url ??
        "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4")
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Stack(
        fit: StackFit.loose,
        alignment: Alignment.center,
        children: [
          Container(
            height: 169.h,
            // width: 342.w,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
            child:
            _controller.value.isInitialized
                ? AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: VideoPlayer(_controller)),
            )
                : Container(),
          ),
          FloatingActionButton(
            onPressed: () {
              setState(() {
                _controller.value.isPlaying
                    ? _controller.pause()
                    : _controller.play();
              });
            }, backgroundColor: Colors.transparent,
            child: Icon(
              _controller.value.isPlaying
                  ? Icons.pause
                  : Icons.play_arrow,

            ),
          ),
          Positioned(
              left: 5,
              top: 5,

              // child: QudsPopupButton(
              //   backgroundColor: Colors.white10,
              //   // tooltip: 'اختر قناة',
              //   items: getMenuItems(),
              //   //           :[QudsPopupMenuWidget(
              //   // builder: (c) =>SizedBox())],
              //   child: Container(
              //
              //     color: Colors.transparent,
              //     child: SvgPicture.asset('images/Share.svg'),
              //   ),)

            child:  PopupMenuButton(
              color: Colors.transparent,
                  icon:  SvgPicture.asset('images/Share.svg'),
                  itemBuilder:(context) => [
                    PopupMenuItem(
                      onTap: null,
                      enabled: false,
                      child: SizedBox(
                        width: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                                radius: 15,
                                backgroundColor: Colors.white54,child:SvgPicture.asset('images/Icon feather-share-2.svg') ),
                            CircleAvatar(
                              radius: 15,
                                backgroundColor: Colors.white54,child: SvgPicture.asset('images/Icon material-delete-sweep.svg')),
                          ],
                        ),
                      ),
                      value: 1,
                    ),
                    PopupMenuItem(
                      onTap: null,
                      enabled: false,
                      child:SizedBox(
                        width:100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:  [
                            CircleAvatar(
                                radius: 15,
                                backgroundColor: Colors.white54,child: SvgPicture.asset('images/Icon awesome-share.svg')),
                            CircleAvatar(
                                radius: 15,
                                backgroundColor: Colors.white54,
                                child: SvgPicture.asset('images/Icon feather-save.svg')),

                          ],
                        ),
                      ),
                      value: 2,
                    )
                  ]
              )
            // InkWell(
            //     onTap: (){
            //       setState(() {
            //         visible=!visible;
            //       });
            //     },
            //     child: Column(
            //       children: [
            //         SvgPicture.asset('images/Share.svg'),
            //
            //       ],
            //     ))
          )
        ],
      ),
    );
  }

  List<QudsPopupMenuBase> getMenuItems() {
    return
      [QudsPopupMenuWidget(
          builder: (c) => Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(5),
              child: IntrinsicWidth(
                stepWidth: .1,
                  child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 5,
                      direction: Axis.horizontal,
                      children: [
                        Icon(Icons.email),
                        Icon(Icons.email),
                        Icon(Icons.email),
                        Icon(Icons.email),
                      ])
              )
          )
      )];
  }
}
