import 'package:advertisers/shared/advertisers_appbar/advertisers_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AdvertiserConfirmBankTransportation extends StatefulWidget{

  const AdvertiserConfirmBankTransportation({Key? key}) : super(key: key);

  @override
  _AdvertiserConfirmBankTransportationState createState() => _AdvertiserConfirmBankTransportationState();
}

class _AdvertiserConfirmBankTransportationState extends State<AdvertiserConfirmBankTransportation> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: PreferredSize(
      //   child: AppBarWidget(
      //     isSearchBar: false,
      //     isNotification: false,
      //     isBack: true,
      //     isSideMenu: false,
      //   ),
      //   preferredSize: Size(MediaQuery.of(context).size.width, 120.h),
      // ),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            gradient:  LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0,3,10],
                colors: [
                  Color(0xff48DBE1),
                  Color(0xff4166CD),
                  Color(0xff236B73)
                ]
            ),
          ),
          child:   Column(
            children: [

              /// header
              Padding(
                padding: const EdgeInsets.only(left: 10.0,right: 10,top: 55),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                   const SizedBox(height: 50,width: 50,),

                    Container(
                      decoration:  BoxDecoration(
                        color: const Color(0xff8DBFC9),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal:16.0,vertical: 4),
                        child: Center(child: Text(
                          "نموذج المعلن",style: TextStyle(fontFamily: 'Abril Fatface, Regular',color: Colors.white),
                        ),),
                      ),
                    ),

                    InkWell(
                      onTap: (){

                      },
                      child: SvgPicture.asset('images/arrow_back.svg',
                        // matchTextDirection: true,
                        height: 50, fit: BoxFit.fitHeight,color: Colors.white,),
                    ),

                  ],
                ),
              ),


              ///first card
              Padding(
                padding: const EdgeInsets.only(left:8.0,right: 8,top: 12,bottom: 8),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color:const Color(0xffF5F5F5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical:8.0,horizontal: 8),
                    child: Column(
                      children: [
                      Row(children: [
                        Padding(
                          padding: const EdgeInsets.only(right:8.0),
                          child: Container(
                            child: Text("التاجر                 :",style: TextStyle(color: Color(0xff707070),fontFamily: 'A Jannat LT, Regular'),),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right:8.0),
                          child: Container(
                            child: Text("محمد علي عبدالله الراشد",style: TextStyle(color: Color(0xff205A9B),fontFamily: 'A Jannat LT, Regular'),),
                          ),
                        ),
                      ],),
                      Row(children: [
                          Padding(
                            padding: const EdgeInsets.only(right:8.0),
                            child: Container(
                              child: Text("رقم الطلب          :",style: TextStyle(color: Color(0xff707070),fontFamily: 'A Jannat LT, Regular'),),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right:8.0),
                            child: Container(
                              child: Text("# 65320",style: TextStyle(color: Color(0xff205A9B),fontFamily: 'A Jannat LT, Regular'),),
                            ),
                          ),
                        ],),
                      Row(children: [
                          Padding(
                            padding: const EdgeInsets.only(right:8.0),
                            child: Container(
                              child: Text("قيمة الطلب         :",style: TextStyle(color: Color(0xff707070),fontFamily: 'A Jannat LT, Regular'),),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right:8.0),
                            child: Container(
                              child: Text("22500",style: TextStyle(color: Color(0xff205A9B),fontFamily: 'A Jannat LT, Regular'),),
                            ),
                          ),

                        Padding(
                          padding: const EdgeInsets.only(right:4.0),
                          child: Container(
                            child: Text("ر.س",style: TextStyle(color: Colors.red,fontFamily: 'A Jannat LT, Regular'),),
                          ),
                        ),

                        ],),
                    ],),
                  ),
                ),
              ),

              ///second card
              Padding(
                padding: const EdgeInsets.only(left:8.0,right: 8,bottom: 8),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color:const Color(0xffF5F5F5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical:8.0,horizontal: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Container(
                            width: MediaQuery.of(context).size.width*.7,
                            decoration:  BoxDecoration(
                              color: const Color(0xff4391D4),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.symmetric( vertical: 4),
                              child: Center(child: Text(
                                "تأكيد استلام تحويل بنكي من عميل",style: TextStyle(fontFamily: 'Abril Fatface, Regular',color: Colors.white),
                              ),),
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top:16.0),
                          child: Row(children: [
                            Padding(
                              padding: const EdgeInsets.only(right:8.0),
                              child: Container(
                                child: Text("قناة الدفع           :",style: TextStyle(color: Color(0xff707070),fontFamily: 'A Jannat LT, Regular'),),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right:8.0),
                              child: Container(
                                child: Text("STC PYA",style: TextStyle(color: Color(0xff205A9B),fontFamily: 'A Jannat LT, Regular'),),
                              ),
                            ),
                          ],),
                        ),

                        Row(children: [
                          Padding(
                            padding: const EdgeInsets.only(right:8.0),
                            child: Container(
                              child: Text("تاريخ التحويل     :",style: TextStyle(color: Color(0xff707070),fontFamily: 'A Jannat LT, Regular'),),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right:8.0),
                            child: Container(
                              child: Text("25-10-2022",style: TextStyle(color: Color(0xff205A9B),fontFamily: 'A Jannat LT, Regular'),),
                            ),
                          ),
                        ],),

                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          Padding(
                            padding: const EdgeInsets.only(right:8.0),
                            child: Container(
                              child: Text("صورة التحويل     :",style: TextStyle(color: Color(0xff707070),fontFamily: 'A Jannat LT, Regular'),),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right:35.0,top: 8),
                            child: Image.asset("images/bank_transfer_img.png",
                              height: MediaQuery.of(context).size.width*.2,
                              width: MediaQuery.of(context).size.width*.2,
                            ),
                          ),
                        ],),

                        Padding(
                          padding: const EdgeInsets.only(right:8.0,top: 20),
                          child: Container(
                            child: Text("ملحوظة من العميل",style: TextStyle(color: Color(0xff707070),fontFamily: 'A Jannat LT, Regular'),),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(bottom:8.0),
                          child: Row(children: [
                            Padding(
                              padding: const EdgeInsets.only(right:8.0),
                              child: Container(
                                child: Text("-",style: TextStyle(color: Color(0xff244094),fontFamily: 'A Jannat LT, Regular'),),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right:8.0),
                              child: Container(
                                child: Text("سيمبنلتسيملنتسيلامسنتلاميسنتل",style: TextStyle(color: Color(0xff244094),fontFamily: 'A Jannat LT, Regular'),),
                              ),
                            ),
                          ],),
                        ),


                        Container(
                          width: MediaQuery.of(context).size.width*.3,
                          decoration:  BoxDecoration(
                            gradient:  const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,

                                colors: [
                                  Color(0xff48DBE1),
                                  Color(0xff4166CD),

                                ]
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.add_circle_outline,color: Colors.white,),
                              Padding(
                                padding: EdgeInsets.all(4),
                                child: Center(child: Text(
                                  "إضافة رد",style: TextStyle(fontFamily: 'Abril Fatface, Regular',color: Colors.white),
                                ),),
                              ),
                            ],
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(vertical:8.0,),
                          child: Container(
                           // height: 35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Color(0xff46C2DC))
                            ),
                            child: TextField(
                              onChanged: (val){

                              },
                              style: TextStyle(fontSize: 14),
                              textAlign: TextAlign.start,
                              textAlignVertical:
                              TextAlignVertical.center,

                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(left: 10.0,right: 10.0,),
                                  // isCollapsed: true,
                                  border: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.circular(
                                        5.0),
                                    borderSide: BorderSide(
                                      width: 0,
                                      style: BorderStyle.none,
                                    ),
                                  ),
                                  filled: true,
                                  hintStyle: TextStyle(
                                      color: Colors.grey[350]),
                                  hintText: 'سيمبنلتسيملنتسيلامسنتلاميسنتل',
                                  fillColor: Colors.white70),
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top:8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(

                                decoration:  BoxDecoration(
                                 color: Color(0xffFFB163),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal:8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Icon(Icons.check ,color:  Color(0xff227D1E)),
                                      Padding(
                                        padding: EdgeInsets.all(4),
                                        child: Center(child: Text(
                                          "استلمت التحويل",style: TextStyle(fontFamily: 'Abril Fatface, Regular',color: Color(0xff227D1E)),
                                        ),),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(

                                decoration:  BoxDecoration(
                                  color: Color(0xffE8E8E8),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal:8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children:   [
                                      Padding(
                                        padding:  const EdgeInsets.all(2),
                                        child: Image.asset("images/remove-line.png",
                                          height: MediaQuery.of(context).size.width*.05,
                                          width: MediaQuery.of(context).size.width*.05,
                                        ),
                                      ),

                                      const Padding(
                                        padding: EdgeInsets.all(4),
                                        child: Center(child: Text(
                                          "لم يصل التحويل",style: TextStyle(fontFamily: 'Abril Fatface, Regular',color: Color(0xffD44545)),
                                        ),),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),


                        Padding(
                          padding: const EdgeInsets.only(top:12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                            Padding(
                              padding: const EdgeInsets.only(right:8.0),
                              child: Container(
                                child: Text("حالة الطلب",style: TextStyle(color: Color(0xff707070),fontFamily: 'A Jannat LT, Regular',fontSize: 16),),
                              ),
                            ),
                              Container(

                                width: MediaQuery.of(context).size.width*.6,
                                decoration:  BoxDecoration(
                                  color: Color(0xffF5F5F5),
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(color: Color(0xff46C2DC))
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(horizontal:25.0),
                                  child: Center(child: Padding(
                                    padding: EdgeInsets.all(4.0),
                                    child: Text(
                                      "بانتظار التحويل",style: TextStyle(fontFamily: 'Abril Fatface, Regular',color: Color(0xff041D67),fontSize: 16),
                                    ),
                                  ),),
                                ),
                              ),
                          ],),
                        ),

                      ],),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top:12.0,left: 45,right: 45,bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [


                    Padding(
                      padding: const EdgeInsets.only(left:20.0),
                      child: Container(

                        width: MediaQuery.of(context).size.width*.3 ,
                        decoration:  BoxDecoration(
                          color: Color(0xffE8E8E8),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal:8.0),
                          child: Padding(
                            padding: EdgeInsets.all(4),
                            child: Center(child: Text(
                              "ارسال",style: TextStyle(fontFamily: 'Abril Fatface, Regular',color: Color(0xff427AD0),fontSize: 15),
                            ),),
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(right:20.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width*.3 ,
                        decoration:  BoxDecoration(
                          color: Color(0xff4391D4),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal:8.0),
                          child: Padding(
                            padding: EdgeInsets.all(4),
                            child: Center(child: Text(
                              "رجوع",style: TextStyle(fontFamily: 'Abril Fatface, Regular',color: Colors.white),
                            ),),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );

  }

}