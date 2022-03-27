import 'package:advertisers/features/wallet_module/Response/history_response.dart';
import 'package:advertisers/features/wallet_module/widgets/processes_widgets/processes_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProcessesItemWidget extends StatelessWidget {
  History? historyItem;
   ProcessesItemWidget({Key? key,this.historyItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // if(processType!.processType == "in")
          // SvgPicture.asset(
          //   'images/wallet_incoming.svg',
          //   fit: BoxFit.fill,
          //   height: 60.0,
          //   width: 60.0,
          // ),
          // if(processType!.processType == "out")
          // SvgPicture.asset(
          //   'images/wallet_outcoming.svg',
          //   fit: BoxFit.fill,
          //   height: 60.0,
          //   width: 60.0,
          // ),
          // if(processType!.processType == "subscription")
          // SvgPicture.asset(
          //   'images/wallet_register.svg',
          //   fit: BoxFit.fill,
          //   height: 60.0,
          //   width: 60.0,
          // ),
          // if(processType!.processType == "wallet_transfer")
          // SvgPicture.asset(
          //   'images/wallet_transfer.svg',
          //   fit: BoxFit.fill,
          //   height: 60.0,
          //   width: 60.0,
          // ),
          Image.network("${historyItem!.action!.icon}",height: 60,width: 60,),
          // const SizedBox(
          //   width: 15,
          // ),
          Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${historyItem!.action!.text}",style: TextStyle(fontSize: 17.sp,fontWeight: FontWeight.bold),maxLines: 1,),
                  Text("${historyItem!.user!.username}",style: TextStyle(fontSize: 15.sp,),maxLines: 1,),
               if(historyItem!.paymentId != null) if(historyItem!.paymentId !="null")   Text("${historyItem!.paymentId}",style: TextStyle(fontSize: 15.sp,),maxLines: 1,),
                ],
              )),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("${historyItem!.total}",style: TextStyle(fontSize: 15.sp,color: priceColor(historyItem!.type)),maxLines: 1,),
              Text("${historyItem!.createdAt!.date}",style: TextStyle(fontSize: 15.sp,),maxLines: 1,),
              Text("${historyItem!.createdAt!.time}",style: TextStyle(fontSize: 15.sp,),maxLines: 1,),
            ],
          )
        ],
      ),
    );
  }
}


Color? priceColor (type){
  Color? priceColorValue;
  // if(type == "in"){
  //   priceColorValue = const Color(0xff3BAA63);
  //   return priceColorValue;
  // }
  if(type == "outcome_wallet"){
    priceColorValue = const Color(0xffC12828);
    return priceColorValue;
  }else{
      priceColorValue = const Color(0xff3BAA63);
      return priceColorValue;
  }
  // if(type == "wallet_transfer"){
  //   priceColorValue = const Color(0xff48DBE1);
  //   return priceColorValue;
  // }
  // if(type == "subscription"){
  //   priceColorValue = const Color(0xffC42929);
  //   return priceColorValue;
  // }
  return priceColorValue;
}