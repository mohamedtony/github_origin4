import 'package:advertisers/features/advertiser_invoice_input/advertiser_invoice_inputs_response.dart';
import 'package:advertisers/features/advertiser_invoice_input/controller/advertiser_invoice_input_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class CostsDiscountsWidget extends StatelessWidget {

  final Data? data;
  CostsDiscountsWidget({this.data});
  @override
  Widget build(BuildContext context) {
    // if(){}
    // static.add(InvoiceItemType(
    //   id: -1,
    //   title: "خصم كوبون مكتسب",
    //   percentage: "${data!.commission}",
    //   // value: double.parse("${data!.commission *  cont}")
    // ));
    return GetBuilder<AdvertiserInvoiceInputsController>(


        init: AdvertiserInvoiceInputsController(),
        builder: (controller) {
          return Container(
            // padding:const EdgeInsets.symmetric(vertical: 15),
            child: Column(
              children: [
                Container(
                  padding:const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 7,
                          child: Container(
                            color:const Color(0xffe3e3e3),
                            child: Center(
                              child: Text("اسم عنصر التكلفة",style: TextStyle(fontSize: 14.sp,),),
                            ),
                          )
                      ),
                      const   SizedBox(
                        width: 8,
                      ),
                      Expanded(
                          flex: 3,
                          child: Container(
                            color:const Color(0xffe3e3e3),
                            child: Center(
                              child: Text("السعر",style: TextStyle(fontSize: 14.sp,),),
                            ),
                          )
                      ),

                    ],
                  ),
                ),
                const  SizedBox(
                  height: 10,
                ),
                ListView.builder(
                    physics:const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.coastList.length,
                    // itemCount: 3,
                    itemBuilder: (context, index) {
                      return Stack(
                        children: [
                          Container(
                            padding:const EdgeInsets.symmetric(horizontal: 15,vertical: 2),
                            child: IntrinsicHeight(
                              child: Row(
                                children: [
                                  Expanded(
                                      flex: 7,
                                      child: Container(
                                        color:const Color(0xfff5f5f5),
                                        child: Center(
                                          child: Container(
                                              padding:const EdgeInsets.symmetric(vertical: 5),
                                              child: Row(
                                                children: [
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Container(
                                                    height: 10,
                                                    width: 10,
                                                    decoration:  BoxDecoration(
                                                      borderRadius: BorderRadius.circular(50),
                                                      gradient:  const LinearGradient(
                                                          begin: Alignment.topRight,
                                                          end: Alignment.bottomRight,
                                                          colors: [
                                                            Color(0xff6fd3de),
                                                            Color(0xff486ac7),
                                                          ]
                                                      ),

                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 15,
                                                  ),
                                                  Expanded(child: Text("${controller.coastList[index].title}",style: TextStyle(fontSize: 14.sp,),)),
                                                ],
                                              )),
                                        ),
                                      )
                                  ),
                                  const   SizedBox(
                                    width: 8,
                                  ),
                                  Expanded(
                                      flex: 3,
                                      child: Container(
                                        padding:const EdgeInsets.symmetric(vertical: 5),
                                        color:const Color(0xfff5f5f5),
                                        child: Center(
                                          child: Row(
                                            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Text("${controller.coastList[index].value}",style: TextStyle(fontSize: 12.sp,),),
                                              const Spacer(),
                                              Text("ر.س",style: TextStyle(fontSize: 12.sp,color:const Color(0xffc87e51)),),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            top:0,
                            bottom: 0,
                            left: 3,
                            child:  Row(
                              children: [
                                InkWell(
                                  onTap: (){
                                    controller.removeFromCoastsList(controller.coastList[index],index);
                                  },
                                  child: Container(
                                    height: 25,
                                    width: 25,
                                    decoration:  BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color:const Color(0xfff07e31),
                                    ),
                                    child:const Icon(Icons.clear,color: Colors.white,size: 15,),
                                  ),
                                ),
                              ],
                            ),),

                        ],
                      );
                    }),

                ListView.builder(
                    physics:const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.discountList.length,
                    // itemCount: 3,
                    itemBuilder: (context, index) {
                      return Stack(
                        children: [
                          Container(
                            padding:const EdgeInsets.symmetric(horizontal: 15,vertical: 2),
                            child: IntrinsicHeight(
                              child: Row(
                                children: [
                                  Expanded(
                                      flex: 7,
                                      child: Container(
                                        color:const Color(0xfff5f5f5),
                                        child: Center(
                                          child: Container(
                                              padding:const EdgeInsets.symmetric(vertical: 5),
                                              child: Row(
                                                children: [
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Container(
                                                    height: 10,
                                                    width: 10,
                                                    decoration:  BoxDecoration(
                                                      borderRadius: BorderRadius.circular(50),
                                                      gradient:  const LinearGradient(
                                                          begin: Alignment.topRight,
                                                          end: Alignment.bottomRight,
                                                          colors: [
                                                            Color(0xff6fd3de),
                                                            Color(0xff486ac7),
                                                          ]
                                                      ),

                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 15,
                                                  ),
                                                  Expanded(child: Text("${controller.discountList[index].title}",style: TextStyle(fontSize: 14.sp,),)),
                                                ],
                                              )),
                                        ),
                                      )
                                  ),
                                  const   SizedBox(
                                    width: 8,
                                  ),
                                  Expanded(
                                      flex: 3,
                                      child: Container(
                                        padding:const EdgeInsets.symmetric(vertical: 5),
                                        color:const Color(0xfff5f5f5),
                                        child: Center(
                                          child: Row(
                                            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Text("- ${controller.discountList[index].value}",style: TextStyle(fontSize: 12.sp,color:const Color(0xffc87e51)),),
                                              // const SizedBox(
                                              //   width: 15,
                                              // ),
                                              const Spacer(),
                                              Text("ر.س",style: TextStyle(fontSize: 12.sp,color:const Color(0xffc87e51)),),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            top:0,
                            bottom: 0,
                            left: 3,
                            child:  Row(
                              children: [
                                InkWell(
                                  onTap: (){
                                    controller.removeFromDiscountList(controller.discountList[index],index);
                                  },
                                  child: Container(
                                    height: 25,
                                    width: 25,
                                    decoration:  BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color:const Color(0xfff07e31),
                                    ),
                                    child:const Icon(Icons.clear,color: Colors.white,size: 15,),
                                  ),
                                ),
                              ],
                            ),),

                        ],
                      );
                    }),
                const SizedBox(
                  height: 3,
                ),

                ListView.builder(
                    physics:const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.static.length,
                    // itemCount: 3,
                    itemBuilder: (context, index) {
                      return Stack(
                        children: [
                          Container(
                            padding:const EdgeInsets.symmetric(horizontal: 15,),
                            child: IntrinsicHeight(
                              child: Row(
                                children: [
                                  Expanded(
                                      flex: 7,
                                      child: Container(
                                        color:const Color(0xfff5f5f5),
                                        child: Center(
                                          child: Container(
                                              padding:const EdgeInsets.symmetric(vertical: 5),
                                              child: Row(
                                                children: [
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Container(
                                                    height: 10,
                                                    width: 10,
                                                    decoration:  BoxDecoration(
                                                      borderRadius: BorderRadius.circular(50),
                                                      gradient:  const LinearGradient(
                                                          begin: Alignment.topRight,
                                                          end: Alignment.bottomRight,
                                                          colors: [
                                                            Color(0xff6fd3de),
                                                            Color(0xff486ac7),
                                                          ]
                                                      ),

                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 15,
                                                  ),
                                                  Expanded(child: Row(
                                                    children: [
                                                      Expanded(child: Text("${controller.static[index].title}",style: TextStyle(fontSize: 14.sp,),)),
                                                      Text("${controller.static[index].percentage}",style: TextStyle(fontSize: 14.sp,),),
                                                      const SizedBox(
                                                        width: 8,
                                                      ),
                                                    ],
                                                  )),
                                                ],
                                              )),
                                        ),
                                      )
                                  ),

                                  const   SizedBox(
                                    width: 8,
                                  ),


                                  Expanded(
                                      flex: 3,
                                      child: Container(
                                        // padding:const EdgeInsets.symmetric(vertical: 5),
                                        color:const Color(0xfff5f5f5),
                                        child: Center(
                                          child: Row(
                                            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Text("${controller.static[index].value}",style: TextStyle(fontSize: 12.sp,color:const Color(0xffc87e51)),),
                                              const Spacer(),
                                              Text("ر.س",style: TextStyle(fontSize: 12.sp,color:const Color(0xffc87e51)),),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                  ),
                                ],
                              ),
                            ),
                          ),


                        ],
                      );
                    }),
                const SizedBox(
                  height: 3,
                ),
                Container(
                  margin:const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                  padding:const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                  color:const Color(0xffe3e3e3),
                  child: Row(
                    children: [
                      Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          Text("الصافي",style: TextStyle(fontSize: 15.sp,color:const Color(0xffD37A47),fontWeight: FontWeight.bold),),
                          const SizedBox(
                            width: 10,
                          ),
                          Text("${(controller.sum??0).toStringAsFixed(1)}",style: TextStyle(fontSize: 14.sp,color:const Color(0xffD37A47),fontWeight: FontWeight.bold),),
                          const SizedBox(
                            width: 10,
                          ),
                          Text("رس",style: TextStyle(fontSize: 14.sp,),),
                          const SizedBox(
                            width:5,
                          ),
                        ],
                      ),
                      Spacer(),
                      Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          Text("الاجمالي",style: TextStyle(fontSize: 15.sp,color:const Color(0xffD37A47),fontWeight: FontWeight.bold),),
                          const SizedBox(
                            width: 10,
                          ),
                          Text("${(controller.sumTotal?? 0).toStringAsFixed(1)}",style: TextStyle(fontSize: 14.sp,color:const Color(0xffD37A47),fontWeight: FontWeight.bold),),
                          const SizedBox(
                            width: 10,
                          ),
                          Text("رس",style: TextStyle(fontSize: 14.sp,),),
                          const SizedBox(
                            width:5,
                          ),
                        ],
                      )
                    ],
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),
                // Container(
                //   padding:const EdgeInsets.symmetric(vertical: 5),
                //   margin:const EdgeInsets.symmetric(horizontal: 15),
                //   decoration:  BoxDecoration(
                //       borderRadius: BorderRadius.circular(10),
                //       color:const Color(0xff66bdd8)
                //   ),
                //   child: Row(
                //     children: [
                //       const SizedBox(
                //         width: 10,
                //       ),
                //       Container(
                //         height: 10,
                //         width: 10,
                //         decoration:  BoxDecoration(
                //             borderRadius: BorderRadius.circular(50),
                //             color: Colors.white
                //         ),
                //       ),
                //       const SizedBox(
                //         width: 10,
                //       ),
                //       Text("رصيد نقاط مكتسب",style: TextStyle(fontSize: 16.sp,color: Colors.white),),
                //       const SizedBox(
                //         width: 5,
                //       ),
                //       Text("1000",style: TextStyle(fontSize: 16.sp,color: Colors.white),),
                //       const SizedBox(
                //         width:5,
                //       ),
                //       Text("نقطة",style: TextStyle(fontSize: 16.sp,color: Colors.white),),
                //       const SizedBox(
                //         width:5,
                //       ),
                //       Text("=",style: TextStyle(fontSize: 16.sp,color: Colors.white),),
                //       const SizedBox(
                //         width:15,
                //       ),
                //       Text("119",style: TextStyle(fontSize: 16.sp,color: Colors.white),),
                //       const SizedBox(
                //         width:15,
                //       ),
                //       Text("ر.س",style: TextStyle(fontSize: 16.sp,color: Colors.white),),
                //     ],
                //   ),
                // )
              ],
            ),
          );
        }
    );
  }
}
