import 'package:advertisers/features/wallet_module/controllers/process_controller.dart';
import 'package:advertisers/features/wallet_module/wallet_controller.dart';
import 'package:advertisers/features/wallet_module/widgets/points_widget_chart.dart';
import 'package:advertisers/features/wallet_module/widgets/processes_item_widgets/processes_item_widget.dart';
import 'package:advertisers/features/wallet_module/widgets/processes_widgets/wallet_table_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
// class PointsWidget extends GetWidget<PointsController> {

class ProcessesWidget extends GetWidget<ProcessesController> {
ProcessesWidget({Key? key}) : super(key: key);


final processesController = Get.put(ProcessesController());


  @override
  Widget build(BuildContext context) {

    return controller.obx(
            (state) {
              List<PointsItem>? pointsItems = [
                PointsItem(
                    title: "عدد النقاط", name: "نقطة", value: state?.data?.points),
                PointsItem(
                    title: "رصيد النقاط", name: "ريال", value: state?.data?.pointsBalance),
                PointsItem(
                    title: "رصيد المحفظة", name: "ريال", value: state?.data?.wallet),
              ];
          return ListView(
            controller: controller.scrollController,
            children: [
              Container(
                height: 125.h,
                child: Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Center(
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: pointsItems.length,
                        itemBuilder: (context, index) {
                          return  PointsChartWidget(value: "${pointsItems![index].value}",name: "${pointsItems![index].name}",title: "${pointsItems![index].title}");
                        }),
                  ),
                ),
              ),

              ListView.separated(
                physics:const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: controller.historyItems.length,
                separatorBuilder: (_, __) => const Divider(
                  height: 0,
                  thickness: 1,
                ),
                itemBuilder: (_, index) {
                  return ProcessesItemWidget(historyItem: controller.historyItems[index] ,);
                },
              ),
              // Container(
              //   height: 100,
              //   width: 100,
              //   color: Colors.red,
              // )

              // const TableWidget(),
            ],
          );
        });
  }
}



class ProcessType {
  int?id;
  String? title,desc,thirdDesc,price,date,time,processType;
  ProcessType({
    this.title,
    this.desc,
    this.thirdDesc,
    this.price,
    this.date,
    this.time,
    this.processType,
    this.id
});
}

List<ProcessType> processTypeList = [
  ProcessType(
    id: 0,
    title: "دفع قيمة الطلب رقم 56330",
    desc: "مصنع ديوان الخليج",
    thirdDesc: "رقم المرجع 444",
    price: "+ 00000.00 ر.س",
    date: "15.10.2022",
    time: "7.30 مساءً",
    processType: "in",
  ),
  ProcessType(
    id: 1,
    title: "دفع قيمة الطلب رقم 56330",
    desc: "مصنع ديوان الخليج",
    thirdDesc: "رقم المرجع 444",
    price: "+ 00000.00 ر.س",
    date: "15.10.2022",
    time: "7.30 مساءً",
    processType: "out",
  ),
  ProcessType(
    id: 2,
    title: "دفع قيمة الطلب رقم 56330",
    desc: "مصنع ديوان الخليج",
    thirdDesc: "رقم المرجع 444",
    price: "+ 00000.00 ر.س",
    date: "15.10.2022",
    time: "7.30 مساءً",
    processType: "wallet_transfer",
  ),
  ProcessType(
    id: 3,
    title: "دفع قيمة الطلب رقم 56330",
    desc: "مصنع ديوان الخليج",
    thirdDesc: "رقم المرجع 444",
    price: "+ 00000.00 ر.س",
    date: "15.10.2022",
    time: "7.30 مساءً",
    processType: "subscription",
  ),
  ProcessType(
    id: 4,
    title: "دفع قيمة الطلب رقم 56330",
    desc: "مصنع ديوان الخليج",
    thirdDesc: "رقم المرجع 444",
    price: "+ 00000.00 ر.س",
    date: "15.10.2022",
    time: "7.30 مساءً",
    processType: "in",
  ),
  ProcessType(
    id: 5,
    title: "دفع قيمة الطلب رقم 56330",
    desc: "مصنع ديوان الخليج",
    thirdDesc: "رقم المرجع 444",
    price: "+ 00000.00 ر.س",
    date: "15.10.2022",
    time: "7.30 مساءً",
    processType: "out",
  ),
  ProcessType(
    id: 6,
    title: "دفع قيمة الطلب رقم 56330",
    desc: "مصنع ديوان الخليج",
    thirdDesc: "رقم المرجع 444",
    price: "+ 00000.00 ر.س",
    date: "15.10.2022",
    time: "7.30 مساءً",
    processType: "wallet_transfer",
  ),
  ProcessType(
    id: 7,
    title: "دفع قيمة الطلب رقم 56330",
    desc: "مصنع ديوان الخليج",
    thirdDesc: "رقم المرجع 444",
    price: "+ 00000.00 ر.س",
    date: "15.10.2022",
    time: "7.30 مساءً",
    processType: "subscription",
  ),
];
