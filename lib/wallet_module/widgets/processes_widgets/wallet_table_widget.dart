import 'package:flutter/material.dart';

class TableWidget extends StatelessWidget {
  const TableWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Table(
              // textDirection: TextDirection.rtl,
              defaultVerticalAlignment:TableCellVerticalAlignment.middle ,
              border: TableBorder(horizontalInside: BorderSide(width: 1, color: Colors.grey.withOpacity(.5), style: BorderStyle.solid),top: BorderSide(width: 1, color: Colors.grey.withOpacity(.5), style: BorderStyle.solid),verticalInside: BorderSide(width: 1, color: Colors.grey.withOpacity(.5), style: BorderStyle.solid),bottom: BorderSide(width: 1, color: Colors.grey.withOpacity(.5), style: BorderStyle.solid)),

              // border: TableBorder.all(color: Colors.grey.withOpacity(.5)),
              children: const [
                TableRow(

                    children: [
                      Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Center(child: Text('النوع',style: TextStyle(fontSize: 18,color: Color(0xff486ac7)),)),
                      ),
                      Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Center(child: Text('التاريخ',style: TextStyle(fontSize: 18,color: Color(0xff486ac7)),)),
                      ),

                      Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Center(child: Text('المصدر',style: TextStyle(fontSize: 18,color: Color(0xff486ac7)),)),
                      ),
                      Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Center(child: Text('القيمة',style: TextStyle(fontSize: 18,color: Color(0xff486ac7)))),
                      ),




                    ]),

                //////////////// start ////////////
                TableRow( children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(child: Icon(Icons.cake, size: 20,)),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(child: Text('02-11-2021',style: TextStyle(fontSize: 14,color: Colors.grey, decoration: TextDecoration.underline,))),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(child: Text('6969 اعلان',style: TextStyle(fontSize: 14,color: Colors.black54, decoration: TextDecoration.underline,))),
                  ),
                  Padding(
                      padding: EdgeInsets.all(8.0),child: Center(child: Text('6969 ر.س',style: TextStyle(fontSize: 14,color: Colors.teal,)))),



                ]),
                //////////////// end ///////////


                ////////////////  start /////////
                TableRow( children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(child: Icon(Icons.cake, size: 20,)),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(child: Text('02-11-2021',style: TextStyle(fontSize: 14,color: Colors.grey, decoration: TextDecoration.underline,))),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(child: Text('6969 اعلان',style: TextStyle(fontSize: 14,color: Colors.black54, decoration: TextDecoration.underline,))),
                  ),
                  Padding(
                      padding: EdgeInsets.all(8.0),child: Center(child: Text('6969 ر.س',style: TextStyle(fontSize: 14,color: Colors.red,)))),



                ]),
                //////////// end /////////////


                //////////////// start ////////////
                TableRow( children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(child: Icon(Icons.cake, size: 20,)),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(child: Text('02-11-2021',style: TextStyle(fontSize: 14,color: Colors.grey, decoration: TextDecoration.underline,))),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(child: Text('6969 اعلان',style: TextStyle(fontSize: 14,color: Colors.black54, decoration: TextDecoration.underline,))),
                  ),
                  Padding(
                      padding: EdgeInsets.all(8.0),child: Center(child: Text('6969 ر.س',style: TextStyle(fontSize: 14,color: Colors.teal,)))),



                ]),
                //////////////// end ///////////


                ////////////////  start /////////
                TableRow( children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(child: Icon(Icons.cake, size: 20,)),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(child: Text('02-11-2021',style: TextStyle(fontSize: 14,color: Colors.grey, decoration: TextDecoration.underline,))),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(child: Text('6969 اعلان',style: TextStyle(fontSize: 14,color: Colors.black54, decoration: TextDecoration.underline,))),
                  ),
                  Padding(
                      padding: EdgeInsets.all(8.0),child: Center(child: Text('6969 ر.س',style: TextStyle(fontSize: 14,color: Colors.red,)))),



                ]),
                //////////// end /////////////


                //////////////// start ////////////
                TableRow( children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(child: Icon(Icons.cake, size: 20,)),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(child: Text('02-11-2021',style: TextStyle(fontSize: 14,color: Colors.grey, decoration: TextDecoration.underline,))),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(child: Text('6969 اعلان',style: TextStyle(fontSize: 14,color: Colors.black54, decoration: TextDecoration.underline,))),
                  ),
                  Padding(
                      padding: EdgeInsets.all(8.0),child: Center(child: Text('6969 ر.س',style: TextStyle(fontSize: 14,color: Colors.teal,)))),



                ]),
                //////////////// end ///////////


                ////////////////  start /////////
                TableRow( children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(child: Icon(Icons.cake, size: 20,)),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(child: Text('02-11-2021',style: TextStyle(fontSize: 14,color: Colors.grey, decoration: TextDecoration.underline,))),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(child: Text('6969 اعلان',style: TextStyle(fontSize: 14,color: Colors.black54, decoration: TextDecoration.underline,))),
                  ),
                  Padding(
                      padding: EdgeInsets.all(8.0),child: Center(child: Text('6969 ر.س',style: TextStyle(fontSize: 14,color: Colors.red,)))),



                ]),
                //////////// end /////////////

              ],
            ),
          ],
        ),
      ),
    );
  }
}
