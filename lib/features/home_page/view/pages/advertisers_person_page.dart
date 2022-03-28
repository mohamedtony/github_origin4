import 'package:advertisers/app_core/network/models/GetAdvertisersModel.dart';
import 'package:advertisers/features/home_page/controller/advertisers_page_controller.dart';
import 'package:advertisers/features/home_page/view/widgets/advertiser_person_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
//=========================================================================================

//                         By Mohamed T. Hammad

//=========================================================================================
class AdvertisersPage extends StatelessWidget {
   AdvertisersPage({Key? key}) : super(key: key);
  AdvertisersPageController advertisersPageController = Get.put(AdvertisersPageController());
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: PagedListView<int, GetAdvertisersModel>(
          pagingController: advertisersPageController.pagingController,

          builderDelegate: PagedChildBuilderDelegate<GetAdvertisersModel>(
            animateTransitions: true,
            noItemsFoundIndicatorBuilder: (context){
              return Container(
                  alignment: Alignment.topCenter,
                  margin: EdgeInsets.only(top:20.0),
                  child: Text('لا يوجد معلنين !',style:TextStyle(color: Colors.blue,fontSize: 18,fontWeight: FontWeight.w600)));
            },
            /*firstPageProgressIndicatorBuilder: (context)=>ListView(
                  shrinkWrap: true,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10.0,),
                      child: ListTile(
                        leading: MyShimmerWidget.circular(height: 64, width: 64),
                        title: Align(
                          alignment: Alignment.centerLeft,
                          child: MyShimmerWidget.rectangular(height: 16,
                            width: MediaQuery.of(context).size.width*2,),
                        ),
                        // subtitle: MyShimmerWidget.rectangular(height: 14),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10.0,),
                      child: ListTile(
                        leading: MyShimmerWidget.circular(height: 64, width: 64),
                        title: Align(
                          alignment: Alignment.centerLeft,
                          child: MyShimmerWidget.rectangular(height: 16,
                            width: MediaQuery.of(context).size.width*2,),
                        ),
                        // subtitle: MyShimmerWidget.rectangular(height: 14),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10.0,),
                      child: ListTile(
                        leading: MyShimmerWidget.circular(height: 64, width: 64),
                        title: Align(
                          alignment: Alignment.centerLeft,
                          child: MyShimmerWidget.rectangular(height: 16,
                            width: MediaQuery.of(context).size.width*2,),
                        ),
                        // subtitle: MyShimmerWidget.rectangular(height: 14),
                      ),
                    )
                  ],
                ),*/

            itemBuilder: (context, item, position) {
              return  InkWell(
                  onTap: (){
                    advertisersPageController.changeIndex(position, item.id!);
                  },
                  child: AdvertiserItem(advertisersModel:item,findAdvertiseController: advertisersPageController,index: position,));
              /*if(findAdvertiseController.isLoading.value){
                    return   Container(
                      margin: EdgeInsets.only(top: 10.0,),
                      child: ListTile(
                        leading: MyShimmerWidget.circular(height: 64, width: 64),
                        title: Align(
                          alignment: Alignment.centerLeft,
                          child: MyShimmerWidget.rectangular(height: 16,
                            width: MediaQuery.of(context).size.width*2,),
                        ),
                        // subtitle: MyShimmerWidget.rectangular(height: 14),
                      ),
                    );
                  }else{
                    return  InkWell(
                        onTap: (){
                          findAdvertiseController.changeIndex(position, item.id!);
                        },
                        child: FindAdvertiseItem(advertisersModel:item,findAdvertiseController: controller,index: position,));
                  }*/
            },
          ),
        )
    )
    ;
  }
}
