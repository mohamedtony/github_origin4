import 'package:advertisers/features/home_page/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
//=========================================================================================

//                         By Mohamed T. Hammad

//=========================================================================================
class AdvertiserItem extends StatelessWidget {
  const AdvertiserItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 4.0,
        shadowColor: Colors.grey[300],
        margin: EdgeInsets.only(top: 9.0,bottom: 10.0,left: 10.0,right: 10.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
          height: 85.0.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
             Container(
                width: 80.0,
                height:80.0,
                margin: EdgeInsets.only(right: 6.0,left: 6.0),
                decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    image: new DecorationImage(
                        fit: BoxFit.cover,
                        image: new AssetImage(
                            'images/image1.jpg'),
                    ),
                  boxShadow: [ // so here your custom shadow goes:
                    BoxShadow(
                      color: Colors.black.withAlpha(25), // the color of a shadow, you can adjust it
                      spreadRadius: 3, //also play with this two values to achieve your ideal result
                      blurRadius: 7,
                      offset: Offset(7, 0), // changes position of shadow, negative value on y-axis makes it appering only on the top of a container
                    ),
                  ],
                ),


             ),
            Flexible(
              child: Container(
                margin: EdgeInsets.only(right: 6.0),
                child: Text(
                  ' حمدى الفريدى',
                  style: TextStyle(color: AppColors.advertiseNameColor,fontSize: 24.0.sp,fontFamily: 'DecoType-Regular',fontWeight: FontWeight.w400),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Container(
              width: 158.0,
             // margin: EdgeInsets.only(left: 10.0,right: 3.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 2.0,right: 2.0),
                    child: SvgPicture.asset(
                      'images/heart_filled.svg',
                      fit: BoxFit.fill,
                      height: 45.0,
                      width: 45.0,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 2.0,right: 2.0),
                    child: SvgPicture.asset(
                      'images/eye.svg',
                      fit: BoxFit.fill,
                      height: 45.0,
                      width: 45.0,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 2.0,right: 2.0),
                    child: SvgPicture.asset(
                      'images/chat_icon_dot.svg',
                      fit: BoxFit.fill,
                      height: 45.0,
                      width: 45.0,
                    ),
                  ),
                ],),
            )
          ],),
        ) );
  }
}
