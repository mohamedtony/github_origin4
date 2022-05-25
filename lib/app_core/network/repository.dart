import 'dart:convert';
import 'package:advertisers/features/advertiser_list_page/advertise_list_controller.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';import 'package:advertisers/main.dart';

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
  void putWithImageMultipart<RES>({
    String? path,
    context,
    Unmarshable<RES>? fromJson,
    Map<String, dynamic>? json,
    Function(int,RES)? onError,
    Function(RES)? onSuccess,
  }) async {
    try {
      // EasyLoading.show();
      print(json);

      final encoder = JsonEncoder.withIndent("  ");
      // final body = encoder.convert(json);
      // debugPrintSynchronously("POST " + base + path + "\n" + body);
      debugPrintSynchronously("PUT " + base + path!);
      final formData = dio.FormData.fromMap(

          json!
      );
      dioDio.options.contentType = dio.Headers.formUrlEncodedContentType;
      dioDio.post(base + path, data: formData, options: dio.Options(
          followRedirects: false,
          //method: 'POST',
          validateStatus: (status) {
            return status! < 500;
          },
          contentType: 'multipart/form-data',
          headers: {
            "Accept": "application/json",
            "Authorization": json["token"]
          },
          responseType: dio.ResponseType.json

      ))
          .then((res) {
        // if(EasyLoading.isShow) {
        //   EasyLoading.dismiss();
        // }
        final data = jsonDecode(jsonEncode(res.data));
        print(data);
        final code = data["status"] as int;
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
          onError!(code, fromJson!(data));
          return;
        }
        onSuccess!(fromJson!(data));
      });
    }on dio.DioError catch(e){
      if(EasyLoading.isShow){
        EasyLoading.dismiss();
      }
      Get.snackbar(
        "خطأ",
        "حدث خطأ ما",
        icon: const Icon(Icons.person, color: Colors.red),
        backgroundColor: Colors.yellow,
        snackPosition: SnackPosition.BOTTOM,);

    }
  }

  void postWithImageMultipart<RES>({
    String? path,
    context,
    Unmarshable<RES>? fromJson,
    Map<String, dynamic>? json,
    Function(int,RES)? onError,
    Function(RES)? onSuccess,
    Function(int,int)? onProgress,
  }) async {
    try {
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
            method: 'POST',
            validateStatus: (status) {
              return status! < 500;
            },
            contentType: 'multipart/form-data',
            headers: {
              "Accept": "application/json",
              "Authorization": json["token"]
            },
            responseType: dio.ResponseType.json,


        ),onSendProgress: (f,s){
          print("f=$f s= $s");
          if(onProgress!=null) {
            onProgress(f, s);
          }
        },onReceiveProgress: (g,u){
          print("ggggg=$g sssss= $u");
        })
            .then((res) {
          // if(EasyLoading.isShow) {
          //   EasyLoading.dismiss();
          // }
          final data = jsonDecode(jsonEncode(res.data));
          print(data);
          final code = data["status"] as int;
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
            onError!(code, fromJson!(data));
            return;
          }
          if(onSuccess!=null) {
            onSuccess(fromJson!(data));
          }
        });
      }on dio.DioError catch(e){
      if(EasyLoading.isShow){
        EasyLoading.dismiss();
      }
      Get.snackbar(
        "خطأ",
       "حدث خطأ ما",
        icon: const Icon(Icons.person, color: Colors.red),
        backgroundColor: Colors.yellow,
        snackPosition: SnackPosition.BOTTOM,);

    }
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
    try {
      if (dontShow != true) {
        EasyLoading.show();
      }
      final encoder = JsonEncoder.withIndent("  ");
      final body = encoder.convert(json);
      debugPrintSynchronously("GET " + base + path! + "\n" + body);

      client.get(Uri.parse(base + path,),
        headers: {
          // 'Content-Type': 'application/json',
          // 'Accept-Type': 'application/json',
          "Authorization": json!["token"],
          "Accept": "application/json",
          // if(storage.read("ownerid")!=null && storage.read("accountype")!=null && storage.read("accountype")=="user")
          //   "OwnerID": "${storage.read("ownerid")}",
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
          onError!(code, fromJson!(data));
          return;
        }
        onSuccess!(fromJson!(data));
      });
    } on dio.DioError catch (e) {
      if (EasyLoading.isShow) {
        EasyLoading.dismiss();
      }
      Get.snackbar(
        "خطأ",
        "حدث خطأ ما",
        icon: const Icon(Icons.person, color: Colors.red),
        backgroundColor: Colors.yellow,
        snackPosition: SnackPosition.BOTTOM,);
    }
  }

  void post<RES>({
    String? path,
    context,
    Unmarshable<RES>? fromJson,
    Map<String, dynamic>? json,
    Map<String, dynamic>? request,
    Function(int,RES)? onError,
    Function(RES)? onSuccess,
    bool? dontShow,
  }) async {
    try {
      if (dontShow != true) {
        EasyLoading.show();
      }
      final encoder = JsonEncoder.withIndent("  ");
      final body = encoder.convert(request);
      debugPrintSynchronously("POST " + base + path! + "\n" + body);


      client
          .post(Uri.parse(base + path,),
        headers: {
          // 'Content-Type': 'application/json',
          // 'Accept-Type': 'application/json',
          "Authorization": json!["token"],
          "Accept": "application/json",
          // if(storage.read("ownerid")!=null && storage.read("accountype")!=null && storage.read("accountype")=="user")
          //   "OwnerID": "${storage.read("ownerid")}",
        },
        body: body,
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
          onError!(code, fromJson!(data));
          return;
        }
        onSuccess!(fromJson!(data));
      });
    } on dio.DioError catch (e) {
      if (EasyLoading.isShow) {
        EasyLoading.dismiss();
      }
      Get.snackbar(
        "خطأ",
        "حدث خطأ ما",
        icon: const Icon(Icons.person, color: Colors.red),
        backgroundColor: Colors.yellow,
        snackPosition: SnackPosition.BOTTOM,);
    }
  }


  void delete<RES>({
    String? path,
    context,
    Unmarshable<RES>? fromJson,
    // Object? json,
    Map<String, dynamic>? json,
    Function(int,RES)? onError,
    Function(RES)? onSuccess,
    bool? dontShow,
  }) async {
    try {
      if (dontShow != true) {
        EasyLoading.show();
      }
      final encoder = JsonEncoder.withIndent("  ");
      final body = encoder.convert(json);
      debugPrintSynchronously("GET " + base + path! + "\n" + body);

      client
          .delete(Uri.parse(base + path,),
        headers: {
          // 'Content-Type': 'application/json',
          // 'Accept-Type': 'application/json',
          "Authorization": json!["token"],
          "Accept": "application/json",
          // if(storage.read("ownerid")!=null && storage.read("accountype")!=null && storage.read("accountype")=="user")
          //   "OwnerID": "${storage.read("ownerid")}",
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
          onError!(code, fromJson!(data));
          return;
        }
        onSuccess!(fromJson!(data));
      });
    } on dio.DioError catch (e) {
      if (EasyLoading.isShow) {
        EasyLoading.dismiss();
      }
      Get.snackbar(
        "خطأ",
        "حدث خطأ ما",
        icon: const Icon(Icons.person, color: Colors.red),
        backgroundColor: Colors.yellow,
        snackPosition: SnackPosition.BOTTOM,);
    }
  }


  // void delete<RES>({
  //   String? path,
  //   context,
  //   Unmarshable<RES>? fromJson,
  //   // Object? json,
  //   Map<String, dynamic>? json,
  //   Function(int,RES)? onError,
  //   Function(RES)? onSuccess,
  //   bool? dontShow,
  // }) async {
  //   try {
  //     if (dontShow != true) {
  //       EasyLoading.show();
  //     }
  //     final encoder = JsonEncoder.withIndent("  ");
  //     final body = encoder.convert(json);
  //     debugPrintSynchronously("Delete " + base + path! + "\n" + body);
  //
  //     client.delete(Uri.parse(base + path,),
  //       headers: {
  //         // 'Content-Type': 'application/json',
  //         // 'Accept-Type': 'application/json',
  //         "Authorization": json!["token"],
  //         "Accept": "application/json",
  //       },
  //       //body: body,
  //     )
  //         .then((res) {
  //       final data = jsonDecode(res.body);
  //       final code = data["status"] as int;
  //       print("HTTP Status Code: " + res.statusCode.toString());
  //       debugPrint("Internal Status Code: " + code.toString());
  //       debugPrintThrottled("Response Body: \n" + encoder.convert(data));
  //       if (code != 200) {
  //         onError!(code, fromJson!(data));
  //         return;
  //       }
  //       onSuccess!(fromJson!(data));
  //     });
  //   } on dio.DioError catch (e) {
  //     if (EasyLoading.isShow) {
  //       EasyLoading.dismiss();
  //     }
  //     Get.snackbar(
  //       "خطأ",
  //       "حدث خطأ ما",
  //       icon: const Icon(Icons.person, color: Colors.red),
  //       backgroundColor: Colors.yellow,
  //       snackPosition: SnackPosition.BOTTOM,);
  //   }
  // }



}