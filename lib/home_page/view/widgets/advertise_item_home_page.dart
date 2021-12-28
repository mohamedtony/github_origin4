import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdvertiseItem extends StatelessWidget {
  const AdvertiseItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 6.0,bottom: 2.0),
      child: Stack(
        children: <Widget>[
          ShaderMask(
            shaderCallback: (rect) {
              return LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.black],
              ).createShader(
                  Rect.fromLTRB(0, 100, rect.width, rect.height - 1));
            },
            blendMode: BlendMode.darken,
            child: Container(
              height: 220.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: ExactAssetImage('images/image1.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Container(
            height: 220.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                    margin: EdgeInsets.only(right: 16.0),
                    child: Text('منذ 6 دقائق', style: TextStyle(color: Colors.white))),
                Container(
                  margin: EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      new Container(
                          width: 50.0,
                          height:50.0,
                          decoration: new BoxDecoration(
                              shape: BoxShape.circle,
                              image: new DecorationImage(
                                  fit: BoxFit.cover,
                                  image: new AssetImage(
                                      'images/image1.jpg')))),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 16.0),
                            child: Text(
                              'محمد تونى حماد',
                              style: TextStyle(color: Colors.white,fontSize: 16.0.sp),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 16.0),
                            child: Text(
                              'فاعليات مهرجان كان السينمائى',
                              style: TextStyle(color: Colors.white70,fontSize: 14.0.sp),
                            ),
                          )
                        ],)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
