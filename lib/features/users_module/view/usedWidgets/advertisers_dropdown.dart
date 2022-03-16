import 'package:advertisers/app_core/network/models/Area.dart';
import 'package:advertisers/app_core/network/models/Country.dart';
import 'package:advertisers/features/users_module/app_colors.dart';
import 'package:advertisers/features/users_module/controller/register_new_client_user_controller.dart';
// import 'package:advertisers/shared/network/models/Area.dart';
// import 'package:advertisers/shared/network/models/Country.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
class AdvertisersDropDown extends StatefulWidget {
 // const AdvertisersDropDown({Key? key}) : super(key: key);
  late String hintText; double? width=323.w;
  Color? borderColor;int? index;
  late List<Area> areas=[Area()];
  late List<dynamic> items;
  void Function(dynamic)? onChanged;
  String? Function(dynamic)? validator;
  String? itemType;
  bool? showSearchBox;bool? empty;
  Future<bool?> Function(dynamic, dynamic)? onBeforeChanged;
  // List<Country>? countries;
  // List<Area>? areas;
  //  Function(int id)? onCountryChanged;
  //  Function(Area area)? onAreaChanged;
  AdvertisersDropDown({this.index,required this.areas,this.onBeforeChanged,this.validator,this.empty,this.showSearchBox, this.itemType,required this.items,this.onChanged,this.borderColor,this.width,required this.hintText,Key? key,}) : super(key: key);

  @override
  State<AdvertisersDropDown> createState() => _AdvertisersDropDownState();
}

class _AdvertisersDropDownState extends State<AdvertisersDropDown> {

// @override
//   void initState() {
//   setState(() {
//     Get.find<RegisterNewClientUserController>().empty.value=false;
//   });
//     // TODO: implement initState
//     super.initState();
//   }
// class AdvertisersDropDown extends StatelessWidget {
//   late String hintText; double? width=323.w;
//   Color? borderColor;
//   late List<dynamic> items;
//   void Function(dynamic)? onChanged;
//   String? itemType;
//   bool? showSearchBox;bool? empty=false;
//    // List<Country>? countries;
//    // List<Area>? areas;
//    //  Function(int id)? onCountryChanged;
//    //  Function(Area area)? onAreaChanged;
//    AdvertisersDropDown({this.empty,this.showSearchBox, this.itemType,required this.items,this.onChanged,this.borderColor,this.width,required this.hintText,Key? key,}) : super(key: key);
// @override
//   void didChangeDependencies() {
//   setState(() {
//     Get.find<RegisterNewClientUserController>().empty.value=false;
//   });
//     // TODO: implement didChangeDependencies
//     super.didChangeDependencies();
//   }

  @override
  Widget build(BuildContext context) {

    return
      // Container(
      // width: width==0?323.w:width,
      // height: 47.h,
      // decoration: BoxDecoration(
      //   color: AppColors.whiteColor,
      //   border: Border.all(color:borderColor==null?AppColors.borderfayrozy: AppColors.borderAdvertiserRegisterColor),
      //   borderRadius: BorderRadius.circular(15),
      // ),
      // child:
     // countries!=null && countries!.isNotEmpty?
      InkWell(
        onTap: (){
          setState(() {
            widget.empty=false;
          });
        },
        child: SizedBox(
          width: widget.width==0?323.w: widget.width,
          // height: 47.h,
          child: DropdownSearch<dynamic>(
            key: widget.key,
            mode: Mode.MENU,showSearchBox:  widget.showSearchBox??true,
            dropDownButton: Padding(
              padding: EdgeInsetsDirectional.only(bottom: 20.0.h,top: 0),
              child:const Icon(Icons.arrow_drop_down_sharp,size: 30,color:Color(0xff244094),),
            ), //showSelectedItems: true,
             //  popupItemBuilder: (context,l,b){
             // // setState(() {
             //
             //      widget.empty=false;
             //
             //    //
             // // });
             //     return widget.empty==true?SizedBox():Center(child: SizedBox(child: Text(l.name),));
             //  },
validator: widget.validator,
onBeforeChange: widget.onBeforeChanged,
            items: widget.items,
            dropdownButtonSplashRadius: 12,
            itemAsString: widget.empty==false? widget.itemType=='String'?(u) => u: widget.itemType=="bakaDetails"?(dynamic? u) => u!.itemAsStringByName():(u) => u.name:(u){
              widget.empty=false;

              return widget.empty==true&&widget.areas.isNotEmpty?u.name:widget.empty==false&&widget.areas.isNotEmpty?u.name:u.name;
            },
          //     dropdownButtonBuilder:widget.empty==true? (context){
          //     return SizedBox();
          // }:null,emptyBuilder: widget.empty==true? (context,v){
          //   return SizedBox();
          // }:null,
             // showSelectedItems: widget.empty==true?false:true,
              selectedItem:widget.empty==true&&widget.areas.isNotEmpty?widget.areas[0]:widget.empty==false&&widget.itemType=='city'&&widget.areas.isNotEmpty?widget.areas[widget.index??0]:null,
         emptyBuilder: (context,v){
              return SizedBox(child:Text(v!));
         },
            //label: "Menu mode",
            //   compareFn: (v,f){
            //   if(v.name==f.name)
            //     return true;
            //   return false;
            //   },
            hint:  widget.hintText,
           // showSelectedItems: true,
            dropdownSearchBaseStyle: TextStyle(fontFamily: 'Arabic-Regular',fontSize: 14.sp),
            dropdownSearchDecoration: InputDecoration(
              contentPadding:  EdgeInsets.symmetric(horizontal: 10.w),

              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.h),borderSide: BorderSide(color: widget.borderColor==null?AppColors.borderfayrozy: AppColors.borderAdvertiserRegisterColor)
              ),

              filled: true,

              disabledBorder:OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.h),borderSide: BorderSide(color: widget.borderColor==null?AppColors.borderfayrozy: AppColors.borderAdvertiserRegisterColor)
              ),fillColor: AppColors.whiteColor,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.h),borderSide: BorderSide(color:  widget.borderColor==null?AppColors.borderfayrozy: AppColors.borderAdvertiserRegisterColor)
              ),
            ),
            onChanged:  widget.onChanged,
            errorBuilder:(context,l,e){
              return SizedBox();
            },
              //  (value){

              // if(this.onCountryChanged!=null && country?.id !=null) {
              //   this.onCountryChanged!(country!.id!);
              // }
           // },
            //selectedItem: "Brazil"
            //),
          ),
        ),
      );
    // :SizedBox(
    //     width: width==0?323.w:width,
    //     height: 47.h,
    //     child: DropdownSearch<Area>(
    //       mode: Mode.MENU,showSearchBox: true,
    //       dropDownButton: Padding(
    //         padding: EdgeInsetsDirectional.only(bottom: 20.0.h,top: 0),
    //         child: Icon(Icons.arrow_drop_down_sharp,size: 30,color:Color(0xff244094),),
    //       ),
    //       items: areas,
    //       dropdownButtonSplashRadius: 12,
    //       itemAsString: (Area? u) => u!.areaAsStringByName(),
    //       //label: "Menu mode",
    //       hint: hintText,dropdownSearchBaseStyle: TextStyle(fontFamily: 'Arabic-Regular',fontSize: 14.sp),
    //       dropdownSearchDecoration: InputDecoration(
    //         contentPadding:  EdgeInsets.symmetric(horizontal: 10.w),
    //
    //         border: OutlineInputBorder(
    //             borderRadius: BorderRadius.circular(12.h),borderSide: BorderSide(color:borderColor==null?AppColors.borderfayrozy: AppColors.borderAdvertiserRegisterColor)
    //         ),
    //
    //         filled: true,
    //
    //         disabledBorder:OutlineInputBorder(
    //             borderRadius: BorderRadius.circular(12.h),borderSide: BorderSide(color:borderColor==null?AppColors.borderfayrozy: AppColors.borderAdvertiserRegisterColor)
    //         ),fillColor: AppColors.whiteColor,
    //         enabledBorder: OutlineInputBorder(
    //             borderRadius: BorderRadius.circular(12.h),borderSide: BorderSide(color: borderColor==null?AppColors.borderfayrozy: AppColors.borderAdvertiserRegisterColor)
    //         ),
    //       ),
    //       onChanged: (area){
    //         if(this.onAreaChanged!=null) {
    //           this.onAreaChanged!(area!);
    //         }
    //       },
    //       //selectedItem: "Brazil"
    //       //),
    //     ),
    //   );
  }
 display (){
  return " ";
  }
}
