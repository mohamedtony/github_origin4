import 'package:flutter/material.dart';


class SelectedAreaWidget extends StatelessWidget {
  String? title;
  VoidCallback?  onPressed;
   SelectedAreaWidget({Key? key,this.title,this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.all(5),
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(3),
            child: Card(
              color: Color(0xffF1F1F1),
              elevation: 8,
              shape:  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 6,horizontal: 15),
                child: Text("$title",style: TextStyle(color: Color(0xff244094)),),
              ),
            ),
          ),
          Positioned(
              top: 0,
              left: 0,
              child: InkWell(
                onTap: onPressed,
                child: Container(
                  height: 18,
                  width: 18,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Color(0xffFF9100),
                  ),
                  child: Icon(Icons.clear,size: 12,color: Colors.white,),
                ),
              ))
        ],
      ),
    );
  }
}
