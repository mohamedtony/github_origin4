import 'package:advertisers/app_core/network/responses/AdvertiserOrderDetailsResponse.dart';
import 'package:advertisers/features/advertiser_order_details/widgets/content_widgets/content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AttachmentsWidget extends StatelessWidget {

  List<Attachments> myAttachments=[];
  AttachmentsWidget({Key? key,required this.myAttachments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Content(
      // hasNote: true,
      title: 'مرفقات الإعلان',
      iconUrl: 'images/attatch_file_icon.png',
      child: GridView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.all(32),
          physics: const NeverScrollableScrollPhysics(),
          itemCount: myAttachments!=null&&myAttachments.isNotEmpty?myAttachments.length:0,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            childAspectRatio: 1,
            crossAxisSpacing: 7,
            mainAxisSpacing: 7,
          ),
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: (){
                showModalBottomSheet<void>(
                  context: context,
                  backgroundColor: Colors.transparent,
                  builder: (BuildContext context) {
                    return Container(
                      child: Material(

                        color: Colors.transparent,
                        borderRadius:
                        BorderRadius.all(Radius.circular(15)),
                        child: Container(
                          height: MediaQuery.of(context).size.height* .45,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                            color: Colors.white,
                          ),
                          child: Column(
                            mainAxisAlignment:
                            MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical:8.0,horizontal: 12),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [

                                    Align(
                                      alignment: AlignmentDirectional.topCenter,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all( Radius.circular(5)),
                                          color: Colors.blue
                                        ),
                                        child: const Padding(
                                          padding:  EdgeInsets.symmetric(vertical:4.0,horizontal: 12),
                                          child: Text("اسم او وصف المرفق",style: TextStyle(color: Colors.white,fontSize:10),),
                                        ),

                                      ),
                                    ),

                                    InkWell(
                                      onTap: (){
                                        Get.back();
                                      },
                                      child: Container(
                                        width: 35,
                                        height: 35,
                                        decoration:  BoxDecoration(
                                          borderRadius: const BorderRadius.all(Radius.circular(35)),
                                          color: Colors.grey.withOpacity(.2),
                                        ),
                                        child: Center(child: Icon(Icons.arrow_forward_ios,color: Colors.blue,)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),


                                Container(
                                  height: MediaQuery.of(context).size.height*.37,
                                  decoration: BoxDecoration(image: DecorationImage(image: NetworkImage("${myAttachments[index].path}",),fit: BoxFit.fill)),

                                ),

                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      height: 80.w,
                      width: 80.w,
                      margin: const EdgeInsets.all(1),
                      decoration: myAttachments[index].path!=null? BoxDecoration(
                        image: DecorationImage(image: NetworkImage("${myAttachments[index].path}")),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.grey,
                        ),
                      ):BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  // Positioned(
                  //     left: 0,
                  //     child: Container(
                  //       padding: const EdgeInsets.all(1),
                  //       decoration: BoxDecoration(
                  //         color: Colors.white,
                  //         borderRadius: BorderRadius.circular(100),
                  //         border: Border.all(
                  //           color: Colors.red,
                  //         ),
                  //       ),
                  //       child: Icon(
                  //         Icons.close,
                  //         color: Colors.red,
                  //         size: 12.sp,
                  //       ),
                  //     ))
                ],
              ),
            );
          }),
    );
  }
}
