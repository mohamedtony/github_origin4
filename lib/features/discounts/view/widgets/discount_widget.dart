import 'package:advertisers/app_core/network/models/CoponModelResponse.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DiscountWidget extends StatelessWidget {
  int? id;
  Color? iconColor;
  String? title,expiredDate,codeNumber,desc,discount;
   DiscountWidget({Key? key,this.copon}) : super(key: key);
   CoponModelResponse? copon;

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.all(10),
      child: InkWell(
        onTap: (){
          Clipboard.setData(ClipboardData(text: "${copon?.code??''}"));
          Fluttertoast.showToast(
            msg: " تم النسخ ${copon?.code??''}",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.black.withOpacity(0.6),
            textColor: Colors.white,
            fontSize: 14.0,
          );
        },
        child: Card(
          child: Container(
            padding: EdgeInsets.all(12),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(" رقم الكود ${copon?.code??''}",style: TextStyle(color: Colors.brown,fontSize: 16.sp),),
                              Expanded(child: Container(
                                  margin: EdgeInsets.only(right: 2,left: 2),
                                  child: Text(" تاريخ الانتهاء ${copon?.ended_at??''} ",style: TextStyle(color: Colors.black54,fontSize: 14.sp),))),

                               
                            ],
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(child: Text("${copon?.name??''}",style: TextStyle(color: Colors.black,fontSize: 18.sp,fontWeight: FontWeight.bold),)),
                              Container(
                                // height: 30,
                                // width: 20,
                                margin: EdgeInsets.all(3),
                                padding: EdgeInsets.symmetric(horizontal: 16,vertical: 6),
                                child: Center(
                                  child: Text("انسخ الكود",style: TextStyle(color: Colors.black54,fontSize: 11.sp),),
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(7.0),
                                  ),
                                ),
                              ),
                              // Text("تاريخ الانتهاء 22/1/44 ",style: TextStyle(color: Colors.black54,fontSize: 12.sp),),
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
                            child: Text("${(copon?.discount??'')} % ",style: TextStyle(color: iconColor??null,fontSize: 16.sp,fontWeight: FontWeight.bold),)),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
              ],
            ),
          ),
        ),
      ),
    );
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
      title: "خصم شهر رمضان الكريم",
      code: "5247886",
      desc: "هذا الخصم يشمل جميع معلنين الرياض والقصيم",
      discount: "20%",
      expiredDate: "01/05/2021",
      iconColor: Colors.brown
  ),
  Discount(
      id: 1,
      title: "خصم شهر رمضان الكريم",
      code: "5247886",
      desc: "هذا الخصم يشمل جميع معلنين الرياض والقصيم",
      discount: "20%",
      expiredDate: "01/05/2021",
      iconColor: Colors.lightBlue
  ),
  Discount(
      id: 2,
      title: "خصم شهر رمضان الكريم",
      code: "5247886",
      desc: "هذا الخصم يشمل جميع معلنين الرياض والقصيم",
      discount: "20%",
      expiredDate: "01/05/2021",
      iconColor: Colors.teal
  ),
  Discount(
      id: 3,
      title: "خصم شهر رمضان الكريم",
      code: "5247886",
      desc: "هذا الخصم يشمل جميع معلنين الرياض والقصيم",
      discount: "20%",
      expiredDate: "01/05/2021",
      iconColor: Colors.brown
  ),
  Discount(
      id: 4,
      title: "خصم شهر رمضان الكريم",
      code: "5247886",
      desc: "هذا الخصم يشمل جميع معلنين الرياض والقصيم",
      discount: "20%",
      expiredDate: "01/05/2021",
      iconColor: Colors.lightBlue
  ),
  Discount(
      id: 5,
      title: "خصم شهر رمضان الكريم",
      code: "5247886",
      desc: "هذا الخصم يشمل جميع معلنين الرياض والقصيم",
      discount: "20%",
      expiredDate: "01/05/2021",
      iconColor: Colors.teal
  ),
];
