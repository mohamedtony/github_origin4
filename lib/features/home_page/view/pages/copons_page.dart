import 'package:advertisers/app_core/network/models/CoponModelResponse.dart';
import 'package:advertisers/features/home_page/controller/copons_page_controller.dart';
import 'package:advertisers/features/home_page/view/widgets/copon_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
//=========================================================================================

//                         By Mohamed T. Hammad

//=========================================================================================
class CoponsPage extends StatefulWidget {
   CoponsPage({Key? key}) : super(key: key);

  @override
  State<CoponsPage> createState() => _CoponsPageState();
}

class _CoponsPageState extends State<CoponsPage> {
   CoponsPageController coponsPageController = Get.put(CoponsPageController());
   @override
   void initState() {
     // TODO: implement initState
     coponsPageController.pagingController.addPageRequestListener((pageKey) async {
       print("hhhhhhhhhhhhhhhhhhhhhhhh");
       await coponsPageController.fetchPage(pageKey);
     });
     super.initState();
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:GetBuilder<CoponsPageController>(
          init: coponsPageController,
          builder: (controller) => PagedListView<int, CoponModelResponse>(
            pagingController: controller.pagingController,
            builderDelegate: PagedChildBuilderDelegate<CoponModelResponse>(
              animateTransitions: true,
              noItemsFoundIndicatorBuilder: (context){
                return Container(
                    alignment: Alignment.topCenter,
                    margin: EdgeInsets.only(top:20.0),
                    child: Text('لا يوجد كوبونات !',style:TextStyle(color: Colors.blue,fontSize: 18,fontWeight: FontWeight.w600)));
              },

              itemBuilder: (context, item, position) {
                return CoponItem(pos: position, coponModelResponse: item);
              },
            ),
          ),)
    );
  }
}
/*
ListView.builder(
itemCount: coponsPageController.coponsResponse?.length ?? 0,
shrinkWrap: true,
itemBuilder: (context, position) {
return  CoponItem(pos: position, coponModelResponse: coponsPageController.coponsResponse![position]);
},
),*/
