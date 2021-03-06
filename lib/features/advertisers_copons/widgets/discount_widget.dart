import 'package:advertisers/app_core/network/models/CoponModelResponse.dart';
import 'package:advertisers/features/advertisers_copons/controller/advertisers_copons_controller.dart';
import 'package:advertisers/features/home_page/app_colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DiscountWidget extends StatelessWidget {
  int? id;
  Color? iconColor;
  String? title,expiredDate,codeNumber,desc,discount;
   DiscountWidget({Key? key,this.copon,required this.index} ) : super(key: key);
   int index;
   CoponModelResponse? copon;
   AdvertisersCoponsController advertisersCoponsController=Get.find();

  @override
  Widget build(BuildContext context) {
    return  Obx(()=>Container(
      margin: EdgeInsets.all(4),
      child: GestureDetector(
        onTap: (){
         // if(advertisersCoponsController.indexClicked.value==index){
            advertisersCoponsController.indexClicked.value=-1;
         // }
        },
        onLongPress: (){
          advertisersCoponsController.showBottomSheetForRequest2(context,copon!);
          advertisersCoponsController.indexClicked.value=index;
          /*if(advertisersCoponsController.indexClicked.value==index){
            advertisersCoponsController.indexClicked.value=-1;
          }*/
        },
        child: Card(
          child: Container(
            padding: EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6),
              //border: Border.all(color: Color(0xffFF8D0A),width: 1.5),
              border: Border.all(color: advertisersCoponsController.indexClicked.value==index?Color(0xFFD47951): copon?.selected!=null && copon!.selected! ? Colors.greenAccent :Colors.grey[300]!  , width: 1.5),
              boxShadow: [
                BoxShadow(
                    color: advertisersCoponsController.indexClicked.value==index?Color(0xFFFFCC99): copon?.selected!=null && copon!.selected! ? Colors.greenAccent :Colors.grey[300]!  ,
                    blurRadius:4,
                    offset: Offset(0, 2), // S
                    spreadRadius:advertisersCoponsController.indexClicked.value==index?1:0// hadow position
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(" ?????? ?????????? ${copon?.code??''}",style: TextStyle(color: Color(0xffAD5F3C),fontSize: 16,fontWeight: FontWeight.bold),),
                              Expanded(child: Container(
                                  margin: EdgeInsets.only(right: 2,left: 2),
                                  child: Text(" ?????????? ???????????????? ${copon?.ended_at??''} ",style: TextStyle(color: Colors.black54,fontSize: 14),))),


                            ],
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(child: Text("${copon?.name??''}",style: TextStyle(color: Colors.black,fontSize: 18.sp,fontWeight: FontWeight.bold),)),
                              /*Container(
                                // height: 30,
                                // width: 20,
                                margin: EdgeInsets.all(3),
                                padding: EdgeInsets.symmetric(horizontal: 16,vertical: 6),
                                child: Center(
                                  child: Text("???????? ??????????",style: TextStyle(color: Colors.black54,fontSize: 11.sp),),
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(7.0),
                                  ),
                                ),
                              ),*/
                              // Text("?????????? ???????????????? 22/1/44 ",style: TextStyle(color: Colors.black54,fontSize: 12.sp),),
                            ],
                          ),
                          Text("${copon?.description??''}",style: TextStyle(color: Colors.black54,fontSize: 12.sp),),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 9,
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        CachedNetworkImage(
                          imageUrl: copon?.image!=null?copon!.image!:"",
                          placeholder: (context, url) =>
                          const SpinKitThreeBounce(
                            color: Colors.grey,
                            size: 25,
                          ),
                          errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                          width: 70.0,
                          height: 75.0.h,
                          fit: BoxFit.fill,
                        )
                        /*SvgPicture.asset(
                          "images/barCode.svg",
                          height: 75.h,
                          color: iconColor??null,
                        )*/,
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Text("${(copon?.discount??'')} % ",style: TextStyle(color: Color(0xffD47951),fontSize: 16.sp,fontWeight: FontWeight.bold),)),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 2,
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}



class Discount {
  int? id;
  Color? iconColor;
  String? title,expiredDate,code,desc,discount;
  Discount({
    this.title,this.id,this.desc,this.discount,this.code,this.expiredDate,this.iconColor
  });}

List<Discount> discounts = [
  Discount(
      id: 0,
      title: "?????? ?????? ?????????? ????????????",
      code: "5247886",
      desc: "?????? ?????????? ???????? ???????? ???????????? ???????????? ??????????????",
      discount: "20%",
      expiredDate: "01/05/2021",
      iconColor: Colors.brown
  ),
  Discount(
      id: 1,
      title: "?????? ?????? ?????????? ????????????",
      code: "5247886",
      desc: "?????? ?????????? ???????? ???????? ???????????? ???????????? ??????????????",
      discount: "20%",
      expiredDate: "01/05/2021",
      iconColor: Colors.lightBlue
  ),
  Discount(
      id: 2,
      title: "?????? ?????? ?????????? ????????????",
      code: "5247886",
      desc: "?????? ?????????? ???????? ???????? ???????????? ???????????? ??????????????",
      discount: "20%",
      expiredDate: "01/05/2021",
      iconColor: Colors.teal
  ),
  Discount(
      id: 3,
      title: "?????? ?????? ?????????? ????????????",
      code: "5247886",
      desc: "?????? ?????????? ???????? ???????? ???????????? ???????????? ??????????????",
      discount: "20%",
      expiredDate: "01/05/2021",
      iconColor: Colors.brown
  ),
  Discount(
      id: 4,
      title: "?????? ?????? ?????????? ????????????",
      code: "5247886",
      desc: "?????? ?????????? ???????? ???????? ???????????? ???????????? ??????????????",
      discount: "20%",
      expiredDate: "01/05/2021",
      iconColor: Colors.lightBlue
  ),
  Discount(
      id: 5,
      title: "?????? ?????? ?????????? ????????????",
      code: "5247886",
      desc: "?????? ?????????? ???????? ???????? ???????????? ???????????? ??????????????",
      discount: "20%",
      expiredDate: "01/05/2021",
      iconColor: Colors.teal
  ),
];
