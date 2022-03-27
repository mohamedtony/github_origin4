import 'package:advertisers/app_core/network/models/CoponModelResponse.dart';
import 'package:advertisers/features/home_page/controller/copons_page_controller.dart';
import 'package:advertisers/features/home_page/view/widgets/my_expand_tile.dart';
import 'package:advertisers/features/home_page/app_colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
//=========================================================================================

//                         By Mohamed T. Hammad

//=========================================================================================
class CoponItem extends StatelessWidget {
   int? pos;
   CoponItem({Key? key,this.pos,this.coponModelResponse}) : super(key: key);
CoponModelResponse? coponModelResponse;
  CoponsPageController controller = Get.find();
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
                  child: CachedNetworkImage(
                    imageUrl: coponModelResponse?.image!=null?coponModelResponse!.image!:"",
                    placeholder: (context, url) =>
                    const SpinKitThreeBounce(
                      color: Colors.grey,
                      size: 25,
                    ),
                    errorWidget: (context, url, error) =>
                    const Icon(Icons.error),
                    width: 70.0,
                    height: 75.0,
                    fit: BoxFit.fitHeight,
                  ),
                  decoration: new BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                    /*image: new DecorationImage(
                      fit: BoxFit.contain,
                      image: CachedNetworkImage(
                        imageUrl: advertiserProfileController.advertiserProfileModel?.image!=null?advertiserProfileController.advertiserProfileModel!.image!:"",
                        placeholder: (context, url) =>
                        const SpinKitThreeBounce(
                          color: Colors.grey,
                          size: 25,
                        ),
                        errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                        width: 70.0,
                        height: 80.0,
                        fit: BoxFit.fitHeight,
                      ),
                         //scale: 0.5
                    )*/
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
                                      child: Text(controller.position==pos&&controller.isOpend?(coponModelResponse?.code!=null?coponModelResponse!.code:'')!:'*****',style: TextStyle(fontSize: 16.0.sp,color: AppColors.coponPercentColorText,),textAlign: TextAlign.center,))),
                                  Container(
                                    width: 75.0,
                                    height:40.0,
                                    //margin: EdgeInsets.only(right: 0.0,left: 6.0),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Container(
                                                margin: EdgeInsets.only(left: 2.0,right: 2.0),
                                                child: Text('${coponModelResponse?.discount??0}',style: TextStyle(fontSize: 16.0,color: Colors.white,),textAlign: TextAlign.center,)),
                                          ),
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
                        coponModelResponse?.ended_at!=null? Expanded(
                          child: Container(
                            margin: EdgeInsets.all(3.0),
                            child: Text(' الانتهاء فى  ${(coponModelResponse?.ended_at) ?? ''}',
                              style: TextStyle(fontSize: 14.0.sp,color: AppColors.coponPercentColorText,fontWeight: FontWeight.w300),textAlign: TextAlign.center,overflow: TextOverflow.ellipsis,maxLines: 2,),),
                        ):SizedBox(),
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
                                Clipboard.setData(ClipboardData(text: '${coponModelResponse?.code ??''}')).then((_){
                                 // Get.snackbar('', 'تم نسخ الكود MS502',snackPosition: SnackPosition.BOTTOM,);
                                  Fluttertoast.showToast(
                                      msg: "تم نسخ الكود ${coponModelResponse?.code ??''}",
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
                              child: Text(' مستعمل ${coponModelResponse?.used??0} مرة',
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
                    InkWell(
                      onTap: (){
                        Share.share('check out my website https://example.com');
                      },
                      child: Container(
                        //margin: EdgeInsets.all(4.0),
                        child: SvgPicture.asset(
                          'images/share_icon.svg',
                          fit: BoxFit.cover,
                          height: 50.0,
                          width: 50.0,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        controller.disLike(coponModelResponse!.id);
                      },
                      child: Container(
                        margin: EdgeInsets.all(4.0),
                        child: SvgPicture.asset(
                          'images/dislik_icon.svg',
                          fit: BoxFit.fill,
                          height: 50.0,
                          width: 50.0,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        controller.likeCopon(coponModelResponse!.id);
                      },
                      child: Container(
                        margin: EdgeInsets.all(4.0),
                        child: SvgPicture.asset(
                          'images/like_icon.svg',
                          fit: BoxFit.fill,
                          height: 50.0,
                          width: 50.0,
                        ),
                      ),
                    ),
                  ],
                ),
                InkWell(
                  onTap: (){
                    if(coponModelResponse?.link!=null) {
                      launchURL(coponModelResponse!.link);
                    }
                  },
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                        margin: EdgeInsets.only(left: 16.0),
                        child: Text('الذهاب لمتجر نشمي',style: TextStyle(fontSize: 20.0.sp,color: AppColors.coponPercentColorText, decoration: TextDecoration.underline,
                          decorationThickness: 2,),textAlign: TextAlign.center,)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }
   launchURL(urlLink) async {
     var url = urlLink;
     if(url != null){
       if (await canLaunch(url)) {
         await launch(url);
       } else {
         throw 'Could not launch $url';
       }
     }

   }
}
