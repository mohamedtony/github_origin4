import 'dart:convert';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
typedef T Unmarshable<T>(Map<String, dynamic> json);
typedef String Marshable<T>(T object);
class Repository {

  final client = http.Client();
  static const encoder = JsonEncoder.withIndent("  ");

  //String base = "http://192.168.43.212:8000"; ///in the home my router
  //String base = "http://192.168.1.3:8000/api";  ///in the office minia
  String base = "https://advertiser.cefour.com/api/v1/";

  //String base = "https://ali-stock.magdsoft.com/api";
  //String base = "http://192.168.1.16:8000/api";
  //String base = "http://192.168.1.16:8000/api";
  //String base = "http://10.0.2.2:8000";
  dio.Dio dioDio = new dio.Dio();

  void postWithImageMultipart<RES>({
    String? path,
    context,
    Unmarshable<RES>? fromJson,
    Map<String, dynamic>? json,
    Function(int,RES)? onError,
    Function(RES)? onSuccess,
  }) async {
    // EasyLoading.show();
    print(json);

    final encoder = JsonEncoder.withIndent("  ");
    // final body = encoder.convert(json);
   // debugPrintSynchronously("POST " + base + path + "\n" + body);
    debugPrintSynchronously("POST " + base + path!);
    final formData = dio.FormData.fromMap(

        json!
    );
    dioDio.options.contentType = dio.Headers.formUrlEncodedContentType;
    dioDio.post(base + path, data: formData, options: dio.Options(
        followRedirects: false,
        method: 'POST', validateStatus: (status) { return status! < 500; },
         contentType: 'multipart/form-data',headers: {"Accept":"application/json", "Authorization":json["token"]},
        responseType: dio.ResponseType.json

    ))
        .then((res) {
          // if(EasyLoading.isShow) {
          //   EasyLoading.dismiss();
          // }
      final data = jsonDecode(jsonEncode(res.data));
      print(data);
      final code = data["status"]as int ;
      //final note = data["message"] as String;
      // if (note != null && note != "done"){
      //   print("isisisHere " + path);
      //   // Toast.show(note, context,
      //   //     gravity: Toast.BOTTOM, duration: Toast.LENGTH_LONG);
      // }
      print("HTTP Status Code: " + res.statusCode.toString());
      // debugPrint("Internal Status Code: " + code.toString());
      debugPrintThrottled("Response Body: \n" + encoder.convert(data));
      if (code != 200) {
        onError!(code,fromJson!(data));
        return;
      }
      onSuccess!(fromJson!(data));
    });

  }

  void get<RES>({
    String? path,
    context,
    Unmarshable<RES>? fromJson,
    // Object? json,
    Map<String, dynamic>? json,
    Function(int,RES)? onError,
    Function(RES)? onSuccess,
    bool? dontShow,
  }) async {
    if(dontShow!=true) {
      EasyLoading.show();
    }
    final encoder = JsonEncoder.withIndent("  ");
    final body = encoder.convert(json);
    debugPrintSynchronously("GET " + base + path! + "\n" + body);

    client
        .get(Uri.parse(base+ path,),
      headers: {
        // 'Content-Type': 'application/json',
        // 'Accept-Type': 'application/json',
        "Authorization":json!["token"],
        "Accept":"application/json",
      },
      //body: body,
    )
        .then((res) {

      final data = jsonDecode(res.body);
      final code = data["status"] as int;
      //final message=data["message"];
      //final note = data["message"] as String;
      // if (note != null && note != "done"){
      //   print("isisisHere " + path);
      //   // Toast.show(note, context,
      //   //     gravity: Toast.BOTTOM, duration: Toast.LENGTH_LONG);
      // }
      print("HTTP Status Code: " + res.statusCode.toString());
      debugPrint("Internal Status Code: " + code.toString());
      debugPrintThrottled("Response Body: \n" + encoder.convert(data));
      if (code != 200) {
        onError!(code,fromJson!(data));
        return;
      }
      onSuccess!(fromJson!(data));
    });
  }
}