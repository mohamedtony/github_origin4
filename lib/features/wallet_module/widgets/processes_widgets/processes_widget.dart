import 'package:advertisers/features/wallet_module/wallet_controller.dart';
import 'package:advertisers/features/wallet_module/widgets/points_widget_chart.dart';
import 'package:advertisers/features/wallet_module/widgets/processes_widgets/wallet_table_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ProcessesWidget extends StatelessWidget {
  const ProcessesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Container(
          height: 125.h,
          child: Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Center(
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: pointsItems!.length,
                  itemBuilder: (context, index) {
                    return  PointsChartWidget(value: "${pointsItems![index].value}",name: "${pointsItems![index].name}",title: "${pointsItems![index].title}");
                  }),
            ),
          ),
        ),
        const TableWidget(),
      ],
    );
  }
}
