import 'package:advertisers/features/wallet_module/widgets/processes_widgets/processes_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProcessesItemWidget extends StatelessWidget {
  ProcessType? processType;
   ProcessesItemWidget({Key? key,this.processType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if(processType!.processType == "in")
          SvgPicture.asset(
            'images/wallet_incoming.svg',
            fit: BoxFit.fill,
            height: 60.0,
            width: 60.0,
          ),
          if(processType!.processType == "out")
          SvgPicture.asset(
            'images/wallet_outcoming.svg',
            fit: BoxFit.fill,
            height: 60.0,
            width: 60.0,
          ),
          if(processType!.processType == "subscription")
          SvgPicture.asset(
            'images/wallet_register.svg',
            fit: BoxFit.fill,
            height: 60.0,
            width: 60.0,
          ),
          if(processType!.processType == "wallet_transfer")
          SvgPicture.asset(
            'images/wallet_transfer.svg',
            fit: BoxFit.fill,
            height: 60.0,
            width: 60.0,
          ),
          // const SizedBox(
          //   width: 15,
          // ),
          Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${processType!.title}",style: TextStyle(fontSize: 17.sp,fontWeight: FontWeight.bold),maxLines: 1,),
                  Text("${processType!.desc}",style: TextStyle(fontSize: 15.sp,),maxLines: 1,),
                  Text("${processType!.thirdDesc}",style: TextStyle(fontSize: 15.sp,),maxLines: 1,),
                ],
              )),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("${processType!.price}",style: TextStyle(fontSize: 15.sp,color: priceColor(processType!.processType)),maxLines: 1,),
              Text("${processType!.date}",style: TextStyle(fontSize: 15.sp,),maxLines: 1,),
              Text("${processType!.time}",style: TextStyle(fontSize: 15.sp,),maxLines: 1,),
            ],
          )
        ],
      ),
    );
  }
}


Color? priceColor (type){
  Color? priceColorValue;
  if(type == "in"){
    priceColorValue = const Color(0xff3BAA63);
    return priceColorValue;
  }
  if(type == "out"){
    priceColorValue = const Color(0xffC12828);
    return priceColorValue;
  }
  if(type == "wallet_transfer"){
    priceColorValue = const Color(0xff48DBE1);
    return priceColorValue;
  }
  if(type == "subscription"){
    priceColorValue = const Color(0xffC42929);
    return priceColorValue;
  }
  return priceColorValue;
}