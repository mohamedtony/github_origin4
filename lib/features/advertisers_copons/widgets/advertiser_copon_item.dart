import 'package:advertisers/app_core/network/models/CoponModelResponse.dart';
import 'package:advertisers/features/advertisers_copons/controller/advertisers_copons_controller.dart';
import 'package:advertisers/features/home_page/view/widgets/my_expand_tile.dart';
import 'package:advertisers/features/home_page/app_colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dropdown_search/dropdown_search.dart';
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
class AdvertiserCoponItem extends StatelessWidget {
  int? pos;
  AdvertiserCoponItem({Key? key,this.pos,this.coponModelResponse}) : super(key: key);
  CoponModelResponse? coponModelResponse;
  AdvertisersCoponsController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AdvertisersCoponsController>(
        init: controller,
        builder: (controller)=>MyExpansionTile(
          tilePadding: EdgeInsets.zero,
          key: Key(pos.toString()),
          title: Card(
            elevation: 4.0,
            shadowColor: Colors.grey[100],
            margin: EdgeInsets.only(top: 2.0,bottom: 2.0,left: 8.0,right: 8.0),
            child: Column(
              children: [
                Row(
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
                          child: Stack(
                              children:[
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(6.0),
                                  child: CachedNetworkImage(
                                    imageUrl: coponModelResponse?.image!=null?coponModelResponse!.image!:"",
                                    placeholder: (context, url) =>
                                    const SpinKitThreeBounce(
                                      color: Colors.grey,
                                      size: 25,
                                    ),
                                    errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                                    width: 80.0,
                                    height:80.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                coponModelResponse?.can_edit!=null &&  coponModelResponse!.can_edit! ?Container(
                                  margin: EdgeInsets.only(top: 4.0),
                                  alignment:Alignment.topLeft,
                                  child: SvgPicture.asset(
                                    'images/star_copon.svg',
                                    // color: Colors.white,
                                    height: 14,
                                    width: 14,
                                  ),
                                ):SizedBox(),]
                          ),
                          decoration: new BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.all(Radius.circular(6)),
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
                                          GetBuilder<AdvertisersCoponsController>(
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
                            margin: EdgeInsets.only(bottom: 6.0,left: 4.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //mainAxisSize: MainAxisSize.min,
                              children: [
                              GetBuilder<AdvertisersCoponsController>(
                              init: controller,
                              builder: (controller)=>(controller.position==pos&&controller.isOpend)&&(coponModelResponse?.can_edit!=null &&  coponModelResponse!.can_edit!)?Container(

                                  height: 26.0,
                                  width: 105,
                                margin: EdgeInsets.only(top: 12,right: 12,bottom: 4),
                                child:
                                DropdownSearch<String>(
                                    mode: Mode.MENU,
                                    //showSelectedItem: true,
                                    dropDownButton: Container(
                                      margin: EdgeInsets.only(bottom: 10),
                                      child: Icon(
                                        Icons.arrow_drop_down,
                                        // size: 20,
                                      ),
                                    ),
                                    showAsSuffixIcons: false,
                                    dropdownSearchDecoration: InputDecoration(
                                      // filled: true,
                                      //fillColor: Color(0xFFF2F2F2),
                                      contentPadding: EdgeInsets.only(right: 4.0, top: 0.0, bottom: 0.0,left: 0.0),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(6)),
                                        borderSide: BorderSide(
                                            width: 1, color: AppColors.copyCodeColor,),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(6)),
                                        borderSide: BorderSide(
                                            width: 1, color: AppColors.copyCodeColor,),
                                      ),
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(6)),
                                          borderSide: BorderSide(
                                            width: 1,
                                          )),
                                    ),
                                    items: controller.status,
                                    dropdownBuilder: (BuildContext context, s) {
                                      return Container(
                                        width: 200,
                                        child: Text(
                                          '${(s ?? '')}',
                                          style: TextStyle(
                                              color: AppColors.copyCodeColor,
                                              decoration: TextDecoration.underline,decorationThickness: 2,
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w500),
                                          textAlign: TextAlign.start,
                                        ),
                                      );
                                    },
                                    // label: "Menu mode",st
                                    itemAsString: (String? u) => u ?? '',
                                    onChanged: (adTypeModel){
                                      if(adTypeModel=='تعديل'){
                                        print("editedit");
                                        if(coponModelResponse?.code!=null && coponModelResponse!.code!.isNotEmpty)
                                           controller.coponNumberController!.text = coponModelResponse!.code!;

                                        if(coponModelResponse?.name!=null && coponModelResponse!.name!.isNotEmpty)
                                          controller.coponNameController!.text = coponModelResponse!.name!;

                                        if(coponModelResponse?.link!=null && coponModelResponse!.link!.isNotEmpty)
                                          controller.coponStoreUrlController!.text = coponModelResponse!.link!;

                                        if(coponModelResponse?.store_name!=null && coponModelResponse!.store_name!.isNotEmpty)
                                          controller.coponStoreNameController!.text = coponModelResponse!.store_name!;

                                        if(coponModelResponse?.uses!=null)
                                          controller.coponUsesController!.text = coponModelResponse!.uses!.toString();

                                        if(coponModelResponse?.discount!=null && coponModelResponse!.link!.isNotEmpty)
                                          controller.coponDiscountController!.text = coponModelResponse!.discount!.toString();

                                        if(coponModelResponse?.ended_at!=null && coponModelResponse!.ended_at!.isNotEmpty)
                                          controller.endAdvertisingDateCoupon.value = coponModelResponse!.ended_at!;

                                        if(coponModelResponse?.image!=null && coponModelResponse!.image!.isNotEmpty)
                                          controller.imagePathCopon.value = coponModelResponse!.image!;

                                        controller.showBottomSheetForRequest(context, coponModelResponse: coponModelResponse!,from: "edit");

                                      }else if(adTypeModel=='حذف'){
                                        showDialog(
                                          context: context,
                                          barrierDismissible: false,
                                          builder: (BuildContext context) {
                                            return Dialog(
                                              child: Container(
                                                height: 180.0,
                                                child: new Column(
                                                  mainAxisSize: MainAxisSize.min,
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: [
                                                    Icon(
                                                        Icons.error,
                                                      color:Colors.red,
                                                      size: 60,
                                                    ),
                                                     Center(
                                                       child: Text("هل انت متأكد من حذف الكوبون !",style: TextStyle(color: AppColors.advertiseNameColor,fontSize: 20.0,fontFamily: 'Arabic-Regular',fontWeight: FontWeight.w400),textAlign: TextAlign.center,

                                                    ),
                                                     ),
                                                    Container(
                                                      margin: EdgeInsets.only(top: 20),
                                                      child: Row(
                                                        crossAxisAlignment: CrossAxisAlignment.end,
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                        MaterialButton(
                                                          color: Colors.red,
                                                          textColor: Colors.white,
                                                         // minWidth: 70,
                                                          child: Container(
                                                              width: 60,
                                                              alignment: Alignment.center,
                                                              child: Text('تأكيد')),
                                                          onPressed: () {
                                                            print('Confirmed');
                                                            Navigator.of(context).pop();
                                                            controller.deleteCopon(context,coponModelResponse!.id);
                                                          },
                                                           /*style:TextButton.styleFrom(
                                                               primary: Colors.white,
                                                               backgroundColor: Colors.red,
                                                             fixedSize: Size.fromWidth(50)
                                                               ),*/
                                                        ),
                                                        SizedBox(width: 30,),
                                                        MaterialButton(
                                                            color: Colors.grey[300],
                                                            textColor: Colors.white,
                                                           // minWidth: 70,
                                                            child: Container(
                                                                width: 60,
                                                                alignment: Alignment.center,
                                                                child: Text('إلغاء')),
                                                          onPressed: () {
                                                            Navigator.of(context).pop();
                                                          },
                                                          /*style:TextButton.styleFrom(
                                                            primary: Colors.white,
                                                            backgroundColor: Colors.grey,
                                                          ),*/
                                                        ),
                                                      ],),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      }else if(adTypeModel=="تنشيط"){
                                        if(coponModelResponse?.status!=null && coponModelResponse!.status==1){
                                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                            content: Text('هذا الكوبون نشط بالفعل !', style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 17,
                                                fontFamily: 'Arabic-Regular'),),
                                          ));
                                          return;
                                        }else{
                                          controller.changeCoponsStatus(context , coponModelResponse!.id!);
                                        }
                                      }else if(adTypeModel=="ايقاف"){
                                        if(coponModelResponse?.status!=null && coponModelResponse!.status==0){
                                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                            content: Text('هذا الكوبون موقوف بالفعل !', style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 17,
                                                fontFamily: 'Arabic-Regular'),),
                                          ));
                                          return;
                                        }else{
                                          controller.changeCoponsStatus(context , coponModelResponse!.id!);
                                        }
                                      }
                                    },
                                    selectedItem: (coponModelResponse?.status!=null && coponModelResponse!.status==1 )?
                                    "نشط" :"موقوف"
                                )
                              ):InkWell(
                                onTap: (){
                                 /* Clipboard.setData(ClipboardData(text: '${coponModelResponse?.code ??''}')).then((_){
                                    // Get.snackbar('', 'تم نسخ الكود MS502',snackPosition: SnackPosition.BOTTOM,);
                                    Fluttertoast.showToast(
                                        msg: "تم نسخ الكود ${coponModelResponse?.code ??''}",
                                        toastLength: Toast.LENGTH_LONG,
                                        gravity: ToastGravity.BOTTOM,
                                        fontSize: 8.0
                                    );
                                  });;*/
                                },
                                child: Container(
                                  //padding: EdgeInsets.only(top:2.0,bottom: 2.0,left: 6.0,right: 6.0),
                                  height: 25,
                                         width: 90,

                                    margin: EdgeInsets.only(top: 12,right: 18,bottom: 4,left: 18),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          color: AppColors.copyCodeColor,
                                        ),
                                        borderRadius: BorderRadius.all(Radius.circular(6))
                                    ),
                                    child: Material(
                                      color: Color(0xffF5F5F5),
                                      elevation: 2.0,
                                      borderRadius: BorderRadius.all(Radius.circular(6)),
                                      child: Padding(
                                           padding: EdgeInsets.only(bottom: 2),
                                          child: Text('${coponModelResponse?.status_txt??''}',style: TextStyle( height: 1.5,color: AppColors.copyCodeColor,fontSize: 14),textAlign: TextAlign.center)),
                                    )
                                ),
                              )),
                            GetBuilder<AdvertisersCoponsController>(
                              init: controller,
                              builder: (controller)=>
                              (controller.position==pos&&controller.isOpend)&&(coponModelResponse?.can_edit!=null &&  coponModelResponse!.can_edit!)?Container(
                                  margin: EdgeInsets.only(left: 10.0),
                                  child: Text('تعديل',
                                    style: TextStyle(fontSize: 18.0.sp,color:  AppColors.copyCodeColor,fontWeight: FontWeight.w300, decoration: TextDecoration.underline,),textAlign: TextAlign.center,overflow: TextOverflow.ellipsis,maxLines: 2,),):SizedBox())
                              ],
                            ),
                          ),

                        ],
                      ),
                    ),

                  ],
                ),
                Container(
                  alignment: Alignment.topRight,
                  margin: EdgeInsets.only(right: 14.0,left: 8.0,bottom: 8.0),
                  child: Text( '${coponModelResponse?.description ?? coponModelResponse?.name}',
                    style: TextStyle(fontSize: 16.0.sp,color: AppColors.coponPercentColorText,fontWeight: FontWeight.bold),textAlign: TextAlign.right,overflow: TextOverflow.ellipsis,maxLines: 2,),)
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
              shadowColor: AppColors.bottomSheetTabColor,
              margin: EdgeInsets.only(top: 2.0,bottom: 2.0,left: 8.0,right: 8.0),
              child: Container(
                height: 85.0,
                color: AppColors.bottomSheetTabColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Column(
                          children: [
                            InkWell(
                              onTap: (){
                                Share.share('${coponModelResponse?.link??''}');
                              },
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(top: 2.0),
                                    padding: EdgeInsets.all(2),
                                    child: Image.asset(
                                      'images/share2.png',
                                      fit: BoxFit.contain,
                                      height: 45.0,
                                      width: 50.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                             // margin: EdgeInsets.only(top: 4),
                                child: Text('${coponModelResponse?.shares??''}'))
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            InkWell(
                              onTap: (){
                                controller.disLike(coponModelResponse!.id);
                              },
                              child: Container(
                                //margin: EdgeInsets.all(4.0),
                                child: Image.asset(
                                  'images/dislike2.png',
                                  fit: BoxFit.contain,
                                  height: 40.0,
                                  width: 45.0,
                                ),
                              ),
                            ),
                            Container(
                                margin: EdgeInsets.only(top: 1),
                                child: Text('${coponModelResponse?.dislikes??''}'))
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            InkWell(
                              onTap: (){
                                controller.likeCopon(coponModelResponse!.id);
                              },
                              child: Container(
                                //margin: EdgeInsets.all(4.0),
                                child: Image.asset(
                                  'images/like2.png',
                                  fit: BoxFit.fill,
                                  height: 40.0,
                                  width: 45.0,
                                ),
                              ),
                            ),
                            Container(
                                margin: EdgeInsets.only(top: 2),
                                child: Text('${coponModelResponse?.likes??''}'))
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            InkWell(
                              onTap: (){
                                controller.likeCopon(coponModelResponse!.id);
                              },
                              child: Container(
                                //margin: EdgeInsets.all(4.0),
                                child: Image.asset(
                                  'images/all_done.png',
                                  fit: BoxFit.contain,
                                  height: 40.0,
                                  width: 45.0,
                                ),
                              ),
                            ),
                            Container(
                                margin: EdgeInsets.only(top: 2),
                                child: Text('${coponModelResponse?.users??''}'))
                          ],
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
                        child: Column(
                          children: [
                            Container(
                                margin: EdgeInsets.only(left: 4.0,top: 8),
                                child: Text('الذهاب لمتجر ${coponModelResponse?.store_name??''}',style: TextStyle(fontSize: 18.0.sp,color: AppColors.coponPercentColorText, decoration: TextDecoration.underline,
                                  decorationThickness: 2,),textAlign: TextAlign.center,maxLines: 2,overflow: TextOverflow.ellipsis,)),
                            Container(
                              margin: EdgeInsets.only(top: 10,left: 4),
                              child: Text('عدد مرات الذهاب ${coponModelResponse?.views ??''}',style: TextStyle(fontSize: 14.0.sp,color: AppColors.coponPercentColorText,
                                decorationThickness: 2,),textAlign: TextAlign.center,),
                            )
                          ],
                        ),
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
