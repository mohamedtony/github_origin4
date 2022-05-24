import 'dart:io';

import 'package:advertisers/NotificationDownloadingService.dart';
import 'package:advertisers/app_core/network/repository.dart';
import 'package:advertisers/app_core/network/responses/CreateAdvertiseRequestResponse.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_background_service_android/flutter_background_service_android.dart';
import 'package:dio/dio.dart' as myDio;
import 'package:logger/logger.dart';

class UploadBackgroundService{
  static final UploadBackgroundService _uploadBackgroundService =
  UploadBackgroundService._internal();

  factory UploadBackgroundService() {
    return _uploadBackgroundService;
  }

  UploadBackgroundService._internal();

  Future<void> initializeService() async {
    final service = FlutterBackgroundService();
    await service.configure(
      androidConfiguration: AndroidConfiguration(
        // this will executed when app is in foreground or background in separated isolate
        onStart: onStart,

        // auto start service
        autoStart: false,
        isForegroundMode: false,

      ),
      iosConfiguration: IosConfiguration(
        // auto start service
        autoStart: true,

        // this will executed when app is in foreground in separated isolate
        onForeground: onStart,

        // you have to enable background fetch capability on xcode project
        onBackground: onIosBackground,
      ),
    );
    service.startService();
  }

  bool onIosBackground(ServiceInstance service) {
    WidgetsFlutterBinding.ensureInitialized();
    print('FLUTTER BACKGROUND FETCH');

    return true;
  }

  void onStart(ServiceInstance service) {
    if (service is AndroidServiceInstance) {
      service.on('setAsForeground').listen((event) async {

        service.setAsForegroundService();
        service.setForegroundNotificationInfo(
            title: "طلبات الاعلان",
            content: "جارى رفع مرفقات طلبكم....."
        );
        print("setAsForegroundsetAsForegroundsetAsForegroundsetAsForeground");
        List<myDio.MultipartFile>? imageFideoFiles = [];


        for(var m in event!["attachments[]"]){
          var mFile =  await myDio.MultipartFile.fromFile(m,
              filename: m
                  .split(Platform.pathSeparator)
                  .last);
          imageFideoFiles.add(mFile);
        }

        event["attachments[]"]=imageFideoFiles;
        /*final service = FlutterBackgroundService();
      var isRunning = await service.isRunning();
      if (isRunning) {
        service.invoke("stopService");
      } else {
        service.startService();
      }*/
        Repository repo = Repository();
        //repo.postWithImageMultipart()
        repo.postWithImageMultipart<CreateAdvertiseRequestResponse>(
            path: 'requests/upload_files',
            fromJson: (json) => CreateAdvertiseRequestResponse.fromJson(json),
            json: event,
            onSuccess: (res) async {
              //Navigator.of(context).pop();
              //Get.back();
              Logger().i(res.toJson());
              //service.stopSelf();

              service.stopSelf();
              //service.invoke("stopService");
              NotificationService().cancelNotification();

              // Get.snackbar("طلبات الاعلان", "تم رفع مرفقات الطلب بنجاح !");
              if (res.message != null) {
                /*ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('تم إنشاء طلبك بنجاح !', style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontFamily: 'Arabic-Regular'),),
              ));*/
              }
              /*Navigator.of(context).pop();
            Navigator.of(context).pop();
            Get.delete<RequestAdvertiseController>();
            Get.delete<FindAdvertiseController>();*/
              //Get.offAllNamed('/Home');
            },onProgress: (prog,max){
          NotificationService().showNotification(prog,max);
        },
            onError: (err, res) {
              //Navigator.of(context).pop();
              // Get.back();
              Logger().i(err);
              service.invoke("stopService");
              NotificationService().cancelNotification();
            });
      });

      service.on('setAsBackground').listen((event) async {
        print("setAsBackgroundsetAsBackgroundsetAsBackgroundsetAsBackground");
        //NotificationService().showNotification(0,2);
        service.setAsBackgroundService();
        //if(event!=null) {
        print("mmMap${event!["ads_request_id"]}");
        // }
        service.setForegroundNotificationInfo(
            title: "My App Service",
            content: "Updated at ${DateTime.now()}"
        );


        List<myDio.MultipartFile>? imageFideoFiles = [];


        for(var m in event["attachments[]"]){
          var mFile =  await myDio.MultipartFile.fromFile(m,
              filename: m
                  .split(Platform.pathSeparator)
                  .last);
          imageFideoFiles.add(mFile);
        }

        event["attachments[]"]=imageFideoFiles;
        /*final service = FlutterBackgroundService();
      var isRunning = await service.isRunning();
      if (isRunning) {
        service.invoke("stopService");
      } else {
        service.startService();
      }*/
        Repository repo = Repository();
        //repo.postWithImageMultipart()
        repo.postWithImageMultipart<CreateAdvertiseRequestResponse>(
            path: 'requests/upload_files',
            fromJson: (json) => CreateAdvertiseRequestResponse.fromJson(json),
            json: event,
            onSuccess: (res) async {
              //Navigator.of(context).pop();
              //Get.back();
              Logger().i(res.toJson());
              //service.stopSelf();
              NotificationService().cancelNotification();
              if (res.message != null) {
                /*ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('تم إنشاء طلبك بنجاح !', style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontFamily: 'Arabic-Regular'),),
              ));*/
              }
              /*Navigator.of(context).pop();
            Navigator.of(context).pop();
            Get.delete<RequestAdvertiseController>();
            Get.delete<FindAdvertiseController>();*/
              //Get.offAllNamed('/Home');
            },onProgress: (prog,max){
          NotificationService().showNotification(prog,max);
        },
            onError: (err, res) {
              //Navigator.of(context).pop();
              // Get.back();
              Logger().i(err);
            });

      });
    }

    service.on('stopService').listen((event) {
      service.stopSelf();
    });
    service.invoke(
      'update',
      {
        "current_date": DateTime.now().toIso8601String(),
        "device": "device",
      },
    );
    // bring to foreground
    /*Timer.periodic(const Duration(seconds: 1), (timer) async {
    if (service is AndroidServiceInstance) {
      service.setForegroundNotificationInfo(
        title: "My App Service",
        content: "Updated at ${DateTime.now()}"
      );
    }

    /// you can see this log in logcat
    print('FLUTTER BACKGROUND SERVICE: ${DateTime.now()}');

    // test using external plugin
    final deviceInfo = DeviceInfoPlugin();
    String? device;
    if (Platform.isAndroid) {
      final androidInfo = await deviceInfo.androidInfo;
      device = androidInfo.model;
    }

    if (Platform.isIOS) {
      final iosInfo = await deviceInfo.iosInfo;
      device = iosInfo.model;
    }

    service.invoke(
      'update',
      {
        "current_date": DateTime.now().toIso8601String(),
        "device": device,
      },
    );
  });*/
  }
}