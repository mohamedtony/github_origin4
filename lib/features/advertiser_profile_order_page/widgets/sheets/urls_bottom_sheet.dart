import 'package:advertisers/features/advertiser_profile_order_page/controller/AdvertiserProfileOrderController.dart';
import 'package:advertisers/features/home_page/app_colors.dart';
import 'package:advertisers/features/request_advertise_module/controller/request_advertise_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
//=========================================================================================

//                         By Mohamed T. Hammad

//=========================================================================================

class UrlsPage extends StatefulWidget {
  ScrollController? scrollController;

  UrlsPage({Key? key, this.scrollController}) : super(key: key);

  @override
  State<UrlsPage> createState() => _UrlsPageState();
}

class _UrlsPageState extends State<UrlsPage>  {
  AdvertiserProfileOrderController advertiserProfileController = Get.find();

  @override
  initState() {
    super.initState();

    animateBegin();


      // _controller.reset();
      //advertiserProfileController.animationControllers[0].reverse()/*.whenComplete(() => _controller.stop())*/;

/*    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    animation = Tween(
      begin: const Offset(0.0, 0.0),
      end: const Offset(0.2, 0.0),
    ).animate(
      CurvedAnimation(
        curve: Curves.decelerate,
        parent: _controller,
      ),
    );

    animation2 = Tween(
      begin: const Offset(0.0, 0.0),
      end: const Offset(1.0, 0.0),
    ).animate(
      CurvedAnimation(
        curve: Curves.decelerate,
        parent: _controller,
      ),
    );*/
  }

/*  @override
  void didUpdateWidget(covariant UrlsPage oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    advertiserProfileController.animationControllers[0].forward().whenComplete(() => advertiserProfileController.animationControllers[0].reverse()*//*.whenComplete(() => _controller.stop())*//*);

  }*/

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
                        'links'.tr,
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
                        'images/link_line_icon.svg',
                        fit: BoxFit.fill,
                        height: 18.0,
                        width: 18.0,
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
                width: 45,
                height: 35,
                margin: EdgeInsets.only(right: 10.0, left: 30.0, top: 0.0),
                child: InkWell(
                  onTap: (){
                    advertiserProfileController.insertNewLinkFields(context);
                  },
                  child: Material(
                    elevation: 6.0,
                    shadowColor: Colors.grey[200],
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    color: AppColors.addPhotoBottom,
                    child: Container(
                      //margin: EdgeInsets.only(left: 15.0),
                      padding: EdgeInsets.only(
                          top: 8.0, bottom: 8.0, right: 12, left: 12.0),
                      child: Image.asset(
                        'images/plus_circle.png',
                        fit: BoxFit.fill,
                        height: 12.0,
                        // width: 12.0,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                child: Obx(()=>advertiserProfileController.numOfLinks.value!=0
                    ? ListView.builder(
                  itemCount: advertiserProfileController.numOfLinks.value,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onPanUpdate: (details) {
                        if (details.delta.dx > 1) {
                          advertiserProfileController.animationControllers[index].forward()/*.whenComplete(() => advertiserProfileController.animationControllers[index].stop())*/;
                        }
                        if (details.delta.dx < 1) {
                          // _controller.reset();
                          advertiserProfileController.animationControllers[index].reverse()/*.whenComplete(() => _controller.stop())*/;
                        }
                      },
                      child: Stack(
                        children: [
                          Positioned(
                            left: -80,
                            top: 5,
                            bottom: 5,
                            child: SlideTransition(
                              position: advertiserProfileController.animationsClose[index],
                              child: Container(
                                width: 45,
                                height: 25,
                                margin: EdgeInsets.only(right: 10.0, left: 28.0, top: 30.0,bottom:30),
                                child: InkWell(
                                  onTap: (){
                                    advertiserProfileController.deleteLink(index);
                                   // advertiserProfileController.animationControllers[index].forward(from: 0.6).whenComplete(() => advertiserProfileController.deleteLink(index));
                                  },
                                  child: Material(
                                    elevation: 6.0,
                                    shadowColor: Colors.grey[200],
                                    borderRadius: BorderRadius.all(Radius.circular(12)),
                                    color: AppColors.bottomSheetTabColorRounded,
                                    child: Container(
                                      //margin: EdgeInsets.only(left: 15.0),
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.only(
                                          top: 4.0, bottom: 4.0, right: 12, left: 12.0),
                                      child: Icon(
                                        Icons.cancel_outlined,
                                        color:
                                        AppColors.white,

                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SlideTransition(
                            position:  advertiserProfileController.animationTextFields[index],
                            child: Container(
                              margin: EdgeInsets.only(bottom: 8),
                              child: Column(
                                children: [
                                  Container(
                                    height: 42,
                                    margin: EdgeInsets.only(
                                        top: 10, left: 22.0, right: 22.0),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.circular(6.0),
                                    ),
                                    child: Material(
                                      elevation: 6.0,
                                      shadowColor: Colors.grey[200],
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                      //borderOnForeground: true,
                                      color: AppColors.saveButtonBottomSheet,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: AppColors.addPhotoBottom,
                                                width: 0.5),
                                            borderRadius:
                                            BorderRadius.circular(12.0),
                                            color: Colors.white),
                                        child: Row(
                                          children: [
                                            Container(
                                                margin: EdgeInsets.only(
                                                    top: 2.0,
                                                    bottom: 2.0,
                                                    left: 10.0,
                                                    right: 10.0),
                                                child: Text(
                                                  "${index+1}",
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.w500,
                                                      fontSize: 16.0),
                                                )),
                                            Container(
                                              margin: const EdgeInsets.symmetric(
                                                  vertical: 8.0),
                                              color: Colors.grey.withOpacity(0.2),
                                              width: 2,
                                            ),
                                            Expanded(
                                              child: TextField(
                                                textAlign: TextAlign.start,
                                                textAlignVertical:
                                                TextAlignVertical.center,
                                                decoration: InputDecoration(
                                                    contentPadding:
                                                    EdgeInsets.only(left: 10.0,right: 10.0,),
                                                    // isCollapsed: true,
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          70.0),
                                                      borderSide: BorderSide(
                                                        width: 0,
                                                        style: BorderStyle.none,
                                                      ),
                                                    ),
                                                    filled: true,
                                                    hintStyle: TextStyle(
                                                        color: Colors.grey[350]),
                                                    hintText: 'اسم الرابط',
                                                    fillColor: Colors.white70),
                                                controller: advertiserProfileController.textUrlControllers[index],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 42,
                                    margin: EdgeInsets.only(
                                        top: 5, left: 22.0, right: 22.0),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.circular(6.0),
                                    ),
                                    child: Material(
                                      elevation: 6.0,
                                      shadowColor: Colors.grey[200],
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                      //borderOnForeground: true,
                                      color: AppColors.saveButtonBottomSheet,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: AppColors.addPhotoBottom,
                                                width: 0.5),
                                            borderRadius:
                                            BorderRadius.circular(12.0),
                                            color: Colors.white),
                                        child: TextField(
                                          textAlign: TextAlign.start,
                                          textAlignVertical:
                                          TextAlignVertical.center,
                                          decoration: InputDecoration(
                                              contentPadding:
                                              EdgeInsets.only(right: 40.0),
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
                                                  color: Colors.grey[350]),
                                              hintText: 'عنوان الرابط',
                                              fillColor: Colors.white70),
                                          controller: advertiserProfileController.urlControllers[index],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                )
                    : Center(child: Text('No Items'))),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 135,
                    height: 35,
                    margin: EdgeInsets.only(right: 10.0, left: 10.0, top: 20.0),
                    child: InkWell(
                      onTap: (){
                        advertiserProfileController.onSaveUrlsClicked(context);
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
                    margin: EdgeInsets.only(right: 10.0, left: 10.0, top: 20.0),
                    child: InkWell(
                      onTap: (){
                        advertiserProfileController.isUrlSaveClicked.value = false;
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
    if (advertiserProfileController.isUrlSaveClicked.isFalse) {
      advertiserProfileController.links.value = [];
      advertiserProfileController.numOfLinks.value = 1;
      advertiserProfileController.urlControllers = [];
      advertiserProfileController.textUrlControllers = [];
      advertiserProfileController.animationsClose = [];
      advertiserProfileController.animationTextFields = [];
      advertiserProfileController.animationControllers = [];
      advertiserProfileController.textUrlControllers.add(
          TextEditingController());
      advertiserProfileController.urlControllers.add(TextEditingController());
      advertiserProfileController.disposeAnimation();
/*      advertiserProfileController.animationControllers.add(AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 200),
      ));

      advertiserProfileController.animationTextFields.add(Tween(
        begin: const Offset(0.0, 0.0),
        end: const Offset(0.2, 0.0),
      ).animate(
        CurvedAnimation(
          curve: Curves.decelerate,
          parent: advertiserProfileController.animationControllers[0],
        ),
      ));

      advertiserProfileController.animationsClose.add(Tween(
        begin: const Offset(0.0, 0.0),
        end: const Offset(1.0, 0.0),
      ).animate(
        CurvedAnimation(
          curve: Curves.decelerate,
          parent:  advertiserProfileController.animationControllers[0],
        ),
      ));
    }*/
      //_controller.dispose();
    }
    super.dispose();
  }

  Future<void> animateBegin() async {
    await Future.delayed(Duration(milliseconds: 800), () => advertiserProfileController.animationControllers[0].forward().whenComplete(() async {
      await Future.delayed(Duration(milliseconds: 800), () => advertiserProfileController.animationControllers[0].reverse()/*.whenComplete(() => _controller.stop())*/);

    }));
  }
}
