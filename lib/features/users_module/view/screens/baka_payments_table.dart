import 'package:advertisers/shared/advertisers_appbar/advertisers_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BakaPaymentsTable extends StatelessWidget {
  const BakaPaymentsTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueAccent,
         appBar:PreferredSize( preferredSize:Size(375.w,90),
         child:  AppBarWidget(isSideMenu: false)),
        body: Material(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.only(topLeft:Radius.circular(12),topRight:Radius.circular(12)),
          child: Container(

            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft:Radius.circular(12),topRight:Radius.circular(12)),
              color: Colors.white,
            ),
            child: Column(
              children: [

                //const TitleSupportWidget(title: "المفضلة", image: 'images/savetodrive.svg'),


                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15,vertical:6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      Container(
                        height: 30.0,
                        padding: EdgeInsets.symmetric(horizontal: 25,vertical: 1),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: Color(0xff4184CE)
                        ),
                        child: Text('مدفوعات الاشتراكات',style: TextStyle(color: Colors.white,fontSize: 15.sp),),
                      ),
                      SvgPicture.asset('images/islamicShow.svg',height: 32.43.h,
                        width: 37.43.w,fit: BoxFit.fitHeight,),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: DataTable(
                          columnSpacing: 20,border: TableBorder.all(color: Colors.grey),
                          columns: const <DataColumn>[
                            DataColumn(
                              label: Text(
                                'الرقم',
                                style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xff2566AF)),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                '   التاريخ',textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xff2566AF),),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'اسم الباقة',
                                style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xff2566AF)),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'المدة',
                                style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xff2566AF)),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'المبلغ',
                                style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xff2566AF)),
                              ),
                            ),
                          ],
                          rows: rows(),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  List<DataRow> rows(){
    List<DataRow>rows=[];
    
    for(int i=0;i<20;i++){

      rows.add(DataRow(cells: [
        DataCell(Text('532014',style:TextStyle(fontSize: 12.sp))),
        DataCell(Text('02-11-2021',style:TextStyle(fontSize: 12.sp))),
        DataCell(Text('الباقة البرونزية',style:TextStyle(fontSize: 12.sp))),
        DataCell(Text('24 شهر',style:TextStyle(fontSize: 12.sp))),
        DataCell(Text('6450 ر.س',style:TextStyle(fontSize: 12.sp,color: Color(0xff289424)))),
        // DataCell(Text(wor.phone,style: TextStyle(color: Colors.blue),)),

      ]));
      
    }
    //totalWorkerMoney=total;
    return rows;
  }
}

