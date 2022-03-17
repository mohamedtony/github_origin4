import 'package:advertisers/shared/radio_buttons/radio_buttons.dart';
import 'package:advertisers/features/wallet_module/wallet_controller.dart';
import 'package:advertisers/features/wallet_module/widgets/points_widget_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShippingWidget extends StatelessWidget {
  const ShippingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ListView(
      children: [
        Container(
          height: 125.h,
          child: Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Center(
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: pointsItems!.length,
                  itemBuilder: (context, index) {
                    return  PointsChartWidget(value: "${pointsItems![index].value}",name: "${pointsItems![index].name}",title: "${pointsItems![index].title}");
                  }),
            ),
          ),
        ),
        Container(
            child: Card(
          child: Container(
            padding: EdgeInsets.all(15),
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  height: 25,
                ),


                GetBuilder<WalletController>(
                  init: WalletController(),
                  builder: (controller) => ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                      // scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: payments.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                            onTap: (){
                              controller.passPaymentIndex(payments[index].id);
                              print("${controller.tabId}");
                            },
                            child:  Container(
                              padding: EdgeInsets.only(bottom: 15),
                              child: Row(
                                // mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  controller.paymentId == payments[index].id  ? selectedBigRadio() : unSelectedBigRadio(),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Container(
                                    width: 70,
                                    child: SvgPicture.asset(
                                      "${payments[index].img}",
                                      // height: 21,
                                      // width: 40,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text("${payments[index].number}",style: TextStyle(color: Colors.grey,fontSize: 18),)
,



                                ],
                              ),
                            )
                        ) ;
                      }),
                ),

                SizedBox(
                  height: 25,
                ),
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * .7,
                  child: Column(
                    children: [
                      Row(
                          // mainAxisAlignment: MainAxisAlignment.end,
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: [



                            Expanded(child: Container(
                                // width: MediaQuery.of(context).size.width * .6,
                                child: Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: Text("أدخل مبلغ الشحن",style: TextStyle( fontSize: 18,color: Color(0xff486ac7)),)))),
                            SizedBox(
                              width: 25,
                            ),

                            Image.asset(
                              "images/income@3x.png",
                              width: 40,
                            ),
                          ],
                        ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [




                          Expanded(
                            flex: 6,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Card(
                                  elevation: 8,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(horizontal: 40,vertical: 3),
                                    child: TextFormField(
                                      cursorColor: Colors.black,
                                      textAlign: TextAlign.center,
                                      keyboardType: TextInputType.number,
                                      decoration: new InputDecoration(
                                          border: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          disabledBorder: InputBorder.none,
                                          hintText: '0.0',
                                          contentPadding:
                                          EdgeInsets.all(0),

                                          hintStyle: TextStyle(fontSize: 21,color: Color(0XffC8714B))),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text("ريال",style: TextStyle( fontSize: 18,color: Color(0xff486ac7)),)
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 25,
                          ),

                          Expanded(
                            flex: 4,
                            child: Container(
                              // margin: const EdgeInsets.symmetric(horizontal: 5),
                              width: 105.w,
                              // height: 75.h,
                              decoration:  BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  gradient:  const LinearGradient(
                                      begin: Alignment.topRight,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        Color(0xff6fd3de),
                                        Color(0xff486ac7),
                                      ]
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey[300]!,
                                      blurRadius: 20.0,
                                      spreadRadius: 1.0,
                                    )
                                  ]
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 9,
                                  ),
                                  Image.asset(
                                    "images/making-money@3x.png",
                                    width: 50,
                                  ),
                                  SizedBox(
                                    height: 1,
                                  ),
                                  Text("اشحن",style: TextStyle( fontSize: 16,color:Colors.white)),
                                  SizedBox(
                                    height: 5,
                                  ),

                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      Row(
                        children: [


                          Expanded(child: InkWell(onTap: (){

                          },
                          child: Container(
                            height: 40,
                            child: Center(
                              child: Text("تأكيد",style: TextStyle(color: Color(0xff4391D4),fontSize: 18,fontWeight: FontWeight.bold),),
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Color(0xffE8E8E8),
                            ),
                          ),)),

                          SizedBox(
                            width: 20,
                          ),
                          Expanded(child: InkWell(onTap: (){

                          },
                            child: Container(
                              height: 40,
                              child: Center(
                                child: Text("رجوع",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Color(0xff4391D4),

                              ),
                            ),)) ,
                        ],
                      ),
                      SizedBox(
                        height: 45,
                      ),
                    ],
                  ),
                  ),
                )


              ],
            ),
          ),
        ))
      ],
    );
  }
}


List<PointsItem>? pointsItems = [
  PointsItem(
      title: "رصيد معلق",
      name: "ريال",
      value: 13000
  ),
  PointsItem(
      title: "ر.قابل للسحب",
      name: "ريال",
      value: 13000
  ),
  PointsItem(
      title: "رصيد المحفظة",
      name: "ريال",
      value: 13000
  ),
];


class Payments {
  int? id;
  String? img,number,name;
  Payments({this.id,this.img,this.number,this.name});
}

List<Payments> payments = [
  Payments(
    id: 0,
    name: "Master Card",
    img: "images/Mastercard.svg",
    number: "**** **** **** 078"
  ),
  Payments(
    id: 1,
    name: "Master Card",
    img: "images/Mastercard.svg",
    number: "**** **** **** 078"
  ),
  Payments(
    id: 2,
    name: "Visa",
    img: "images/Visa.svg",
    number: "**** **** **** 078"
  ),
];