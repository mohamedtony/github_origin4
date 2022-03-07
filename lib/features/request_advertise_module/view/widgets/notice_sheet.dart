import 'package:advertisers/features/home_page/app_colors.dart';
import 'package:advertisers/features/request_advertise_module/controller/request_advertise_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
//=========================================================================================

//                         By Mohamed T. Hammad

//=========================================================================================
class NoticeSheet extends StatefulWidget {
  ScrollController? scrollController;

  NoticeSheet({Key? key, this.scrollController}) : super(key: key);

  @override
  State<NoticeSheet> createState() => _NoticeSheetState();
}

class _NoticeSheetState extends State<NoticeSheet> {
  RequestAdvertiseController requestAdvertiseController=Get.find();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(requestAdvertiseController.isNoticeSaveClicked.isFalse){
      //----------------------------------------- for discount sheet ------------------------------------
      requestAdvertiseController.noticeController=  TextEditingController();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        controller: this.widget.scrollController,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                //margin: EdgeInsets.only(top: 10.0),
                padding: EdgeInsets.all(8.0),
                color: AppColors.bottomSheetTabColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 30.0,
                      width: 140.0,
                      //padding: EdgeInsets.all(8.0),
                      margin: EdgeInsets.only(right: 8.0),
                      child: Text(
                        'noticeable'.tr,
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.0),
                          color: AppColors.tabColor),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 18.0),
                      child: SvgPicture.asset(
                        'images/notice_icon.svg',
                        fit: BoxFit.fill,
                        height: 22.0,
                        width: 22.0,
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                color: AppColors.dividerBottom,
                thickness: 4.0,
              ),
              Container(
                height: 220,
                margin: EdgeInsets.only(
                    top: 25, left: 22.0, right: 22.0),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(6.0),
                ),
                child: Material(
                  elevation: 6.0,
                  shadowColor: Colors.grey[200],
                  borderRadius:
                  BorderRadius.all(Radius.circular(18)),
                  //borderOnForeground: true,
                  color: AppColors.saveButtonBottomSheet,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: AppColors.tabColor,
                            width: 0.7),
                        borderRadius:
                        BorderRadius.circular(18.0),
                        color: Colors.white),
                    child: TextField(
                      textAlign: TextAlign.start,
                      textAlignVertical:
                      TextAlignVertical.center,
                      maxLines: 10,
                      decoration: InputDecoration(
                          contentPadding:
                          EdgeInsets.only(right: 20.0,left: 10.0),
                          // isCollapsed: true,
                          border: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.circular(70.0),
                            borderSide: BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          ),
                          filled: true,
                          hintStyle: TextStyle(
                              color: AppColors.tabColor),
                          hintText: 'noticeable'.tr,
                          fillColor: Colors.white70),
                      controller: requestAdvertiseController.noticeController,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 135,
                    height: 35,
                    margin: EdgeInsets.only(right: 10.0, left: 10.0, top: 50.0),
                    child: InkWell(
                      onTap: (){
                        requestAdvertiseController.onNoticeSavedClicked(context);
                      },
                      child: Material(
                        elevation: 6.0,
                        shadowColor: Colors.grey[200],
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        color: AppColors.saveButtonBottomSheet,
                        child: Container(
                          /*margin: EdgeInsets.only(
                                left: 12.0, bottom: 4.0, right: 20),*/
                          alignment: Alignment.center,
                          child: Text(
                            'save'.tr,
                            style: TextStyle(
                                fontSize: 16.0,
                                color: AppColors.tabColor,
                                fontWeight: FontWeight.w700),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 135,
                    height: 35,
                    margin: EdgeInsets.only(right: 10.0, left: 10.0, top: 50.0),
                    child: InkWell(
                      onTap: (){
                        requestAdvertiseController.isNoticeSaveClicked.value = false;
                        Get.back();
                      },
                      child: Material(
                        elevation: 6.0,
                        shadowColor: Colors.grey[200],
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        color: AppColors.tabColor,
                        child: Container(
                          /*margin: EdgeInsets.only(
                                left: 12.0, bottom: 4.0, right: 20),*/
                          alignment: Alignment.center,
                          child: Text(
                            'إستعادة',
                            style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w300),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose

    if(requestAdvertiseController.isNoticeSaveClicked.isFalse){
      //----------------------------------------- for discount sheet ------------------------------------
      requestAdvertiseController.noticeController?.dispose();
    }
    super.dispose();
  }
}
