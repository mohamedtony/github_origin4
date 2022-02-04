import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
//=========================================================================================

//                         By Mohamed T. Hammad

//=========================================================================================
class MyShimmerWidget extends StatelessWidget {

  final double width;
  final double height;
  final ShapeBorder shapeBorder;

  const MyShimmerWidget.rectangular({
    this.width = double.infinity,
    required this.height
  }): this.shapeBorder = const RoundedRectangleBorder();

  const MyShimmerWidget.circular({
    this.width = double.infinity,
    required this.height,
    this.shapeBorder = const CircleBorder()
  });

  @override
  Widget build(BuildContext context)  => Shimmer.fromColors(
    baseColor: Colors.grey[400]!,
    highlightColor: Colors.grey[300]!,
    period: Duration(seconds: 2),
    loop: 2,
    child: Container(
      width: width,
      height: height,
      decoration: ShapeDecoration(
        color: Colors.grey[400]!,
        shape: shapeBorder,

      ),
    ),
  );
}