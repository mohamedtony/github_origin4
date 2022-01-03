import 'package:advertisers/features/home_page/controller/copons_page_controller.dart';
import 'package:advertisers/features/home_page/view/widgets/my_expand_tile.dart';
import 'package:advertisers/features/home_page/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class CoponItem extends StatelessWidget {
   int? pos;
   CoponItem({Key? key,this.pos}) : super(key: key);
  CoponsPageController controller = Get.put(CoponsPageController());
   @override
  Widget build(BuildContext context) {
    return GetBuilder<CoponsPageController>(
        init: controller,
        builder: (controller)=>MyExpansionTile(
      tilePadding: EdgeInsets.zero,
      key: Key(pos.toString()),
      title: Card(
        elevation: 4.0,
        shadowColor: Colors.grey[100],
        margin: EdgeInsets.only(top: 2.0,bottom: 2.0,left: 8.0,right: 8.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(right: 10.0,left: 10.0,top: 8.0),
              child: Material(
                elevation: 4.0,
                borderRadius: BorderRadius.all(Radius.circular(6)),
                child: Container(
                  width: 80.0,
                  height:80.0,
                  //padding: EdgeInsets.only(left: 10.0,right: 22.0),
                  decoration: new BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                    image: new DecorationImage(
                      fit: BoxFit.contain,
                      image: new AssetImage(
                          'images/namshi_logo.jpg'),
                         //scale: 0.5
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 8.0),
                    child: Row(
                      children: [
                        Material(
                          elevation: 4.0,
                          color:AppColors.coponPercentColor,
                          borderRadius: BorderRadius.all(Radius.circular(6)),
                          child: Container(
                              //width: 130.0,
                              height:35.0,
                              // margin: EdgeInsets.all(4.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                              GetBuilder<CoponsPageController>(
                              init: controller,
                            builder: (controller)=>
                                Container(
                                      margin: EdgeInsets.all(4.0),
                                      child: Text(controller.position==pos&&controller.isOpend?'MS502':'*****',style: TextStyle(fontSize: 16.0.sp,color: AppColors.coponPercentColorText,),textAlign: TextAlign.center,))),
                                  Container(
                                    width: 70.0,
                                    height:40.0,
                                    //margin: EdgeInsets.only(right: 0.0,left: 6.0),
                                    child: Row(
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                              margin: EdgeInsets.only(left: 2.0,right: 7.0),
                                              child: Text('15',style: TextStyle(fontSize: 16.0.sp,color: Colors.white,),textAlign: TextAlign.center,)),
                                        ),
                                        Container(
                                          margin: EdgeInsets.all(4.0),
                                          child: SvgPicture.asset(
                                            'images/coupon_percentage.svg',
                                            fit: BoxFit.fill,
                                            height: 30.0,
                                            width: 30.0,
                                          ),
                                        ),
                                      ],
                                    ),

                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [AppColors.beginColor, AppColors.endColor],
                                      ),
                                      shape: BoxShape.rectangle,
                                      //color: Colors.red,
                                      borderRadius: BorderRadius.all(Radius.circular(8)),
                                      boxShadow: [ // so here your custom shadow goes:
                                        BoxShadow(
                                            color: Colors.black.withAlpha(25), // the color of a shadow, you can adjust it
                                            spreadRadius: 2, //also play with this two values to achieve your ideal result
                                            blurRadius: 4.0,
                                            offset: Offset(2, 1.5) // changes position of shadow, negative value on y-axis makes it appering only on the top of a container
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              )),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.all(3.0),
                            child: Text('الانتهاء فى 10/10/2014',
                              style: TextStyle(fontSize: 14.0.sp,color: AppColors.coponPercentColorText,fontWeight: FontWeight.w300),textAlign: TextAlign.center,overflow: TextOverflow.ellipsis,maxLines: 2,),),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(3.0),
                    child: Text('قسيمة تخفيض نون 15 % على كل منتجات نون السعودية',
                      style: TextStyle(fontSize: 16.0.sp,color: AppColors.coponPercentColorText,fontWeight: FontWeight.bold),textAlign: TextAlign.right,overflow: TextOverflow.ellipsis,maxLines: 2,),),
                  Container(
                    margin: EdgeInsets.only(bottom: 14.0,left: 4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GetBuilder<CoponsPageController>(
                          //init: CoponsPageController(),
                            builder: (controller)=>
                            controller.position==pos&&controller.isOpend?InkWell(
                              onTap: (){
                                Clipboard.setData(ClipboardData(text: "MS502")).then((_){
                                 // Get.snackbar('', 'تم نسخ الكود MS502',snackPosition: SnackPosition.BOTTOM,);
                                  Fluttertoast.showToast(
                                      msg: "تم نسخ الكود MS502",
                                      toastLength: Toast.LENGTH_LONG,
                                      gravity: ToastGravity.BOTTOM,
                                      fontSize: 16.0
                                  );
                                });;
                              },
                              child: Container(
                                  padding: EdgeInsets.only(top:2.0,bottom: 2.0,left: 6.0,right: 6.0),
                                  margin: EdgeInsets.only(left: 6.0,right: 6.0),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: AppColors.copyCodeColor,
                                      ),
                                      borderRadius: BorderRadius.all(Radius.circular(6))
                                  ),
                                  child: Text('copyCode'.tr,style: TextStyle(color: AppColors.copyCodeColor),)
                              ),
                            ):Container()),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.all(4.0),
                              child: SvgPicture.asset(
                                'images/done_all_tick.svg',
                                fit: BoxFit.fill,
                                height: 14.0,
                                width: 14.0,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(3.0),
                              child: Text(' مستعمل 215 مرة',
                                style: TextStyle(fontSize: 14.0.sp,color: AppColors.coponPercentColorText,fontWeight: FontWeight.w300),textAlign: TextAlign.center,overflow: TextOverflow.ellipsis,maxLines: 2,),),
                          ],
                        ),

                      ],
                    ),
                  )
                ],
              ),
            )

          ],
        ),
      ),
      onExpansionChanged: (h){
        controller.changeStatus(h, pos!);

        print("onExpansionChanged "+h.toString());
      },
      initiallyExpanded: controller.position==pos,
      children: <Widget>[
        Card(
          elevation: 6.0,
          shadowColor: Colors.grey[300],
          margin: EdgeInsets.only(top: 2.0,bottom: 2.0,left: 8.0,right: 8.0),
          child: Container(
            height: 50.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      //margin: EdgeInsets.all(4.0),
                      child: SvgPicture.asset(
                        'images/share_icon.svg',
                        fit: BoxFit.cover,
                        height: 50.0,
                        width: 50.0,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(4.0),
                      child: SvgPicture.asset(
                        'images/dislik_icon.svg',
                        fit: BoxFit.fill,
                        height: 50.0,
                        width: 50.0,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(4.0),
                      child: SvgPicture.asset(
                        'images/like_icon.svg',
                        fit: BoxFit.fill,
                        height: 50.0,
                        width: 50.0,
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                      margin: EdgeInsets.only(left: 16.0),
                      child: Text('الذهاب لمتجر نشمي',style: TextStyle(fontSize: 20.0.sp,color: AppColors.coponPercentColorText, decoration: TextDecoration.underline,
                        decorationThickness: 2,),textAlign: TextAlign.center,)),
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
