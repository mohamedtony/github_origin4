import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
//=========================================================================================

//                         By Mohamed T. Hammad

//=========================================================================================
class AdvertiseListItem extends StatelessWidget {

  String? icon,title;
  VoidCallback?  listTilePressed;

   AdvertiseListItem({Key? key,this.icon,this.listTilePressed,this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(leading:Container(
          margin: EdgeInsets.only(right: 10.0,top: 2.0),
          child: SvgPicture.asset(
            icon!,
            height: 24,
            width: 24,
            //color:  Color(0xff486ac7),
          ),
        ),
          title: Text(title!,style: TextStyle(color: Color(0xff4184CE)),),
          trailing: Container(
              margin: EdgeInsets.only(left: 20,top:2.0),
              child: Icon(Icons.arrow_forward_ios_rounded,size: 17,color:  Color(0xff486ac7),)),
        onTap: listTilePressed,
        ),
        Divider(
          color: Colors.grey[300],indent: 20,
          endIndent: 20,
          thickness: 0.6,
        ),
      ],
    );
  }
}
