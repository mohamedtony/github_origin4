// import 'dart:async';
// import 'dart:convert';
//
//
// import 'package:pusher/AppSettings.dart';
// import 'package:pusher/SocketMessage.dart';
//
// import 'package:pusher_client/pusher_client.dart';
//
// import 'SocketResult.dart';
//
// class AppPusher {
//   // static final _appPusher = AppPusher._internal();
//   //
//   // AppPusher._internal();
//   //
//   // factory AppPusher() {
//   //   return _appPusher;
//   // }
//
//  // final String _messaging = 'messaging';
//   final String _messaging = 'ChatSent';
//   final String _notifications = 'notifications';
//
//   PusherClient? _pusher;
//
//   Channel? _channel;
//   String? _channelName;
//
//   final _pusherData = StreamController<Map<String, dynamic>>.broadcast();
//   Stream<Map<String, dynamic>> get stream => _pusherData.stream;
//
//   //void connect({required Me me}) {
//     void connect({required SocketResult socketResult}) {
//     //if (_pusher == null) {
//       //final token = _getToken1();
//       print(">>>>>>>>>>step1");
//       _pusher = PusherClient(
//         AppSettings.key,
//         PusherOptions(
//           cluster: AppSettings.cluster,
//           encrypted: true,
//           //auth: PusherAuth(
//             //AppSettings.url,
//             //headers: {'Authorization': 'Bearer $token'},
//               //headers: {'Authorization': 'Bearer 1882|wgo1MY3Q5vPBbA606nQyTMJ119bvmEnE3mDtAajY'},
//           //),
//         ),
//         autoConnect: true,
//         enableLogging: AppSettings.enableLogging,
//       );
//
//       // _channelName = 'private-user-${me.id}';
//       //_channelName = 'private-user-${me}';
//       _channelName = 'my-channel';
//       _channel = _pusher!.subscribe(_channelName!);
//       print(">>>>>>>>step2 beforesending");
//       _channel!.bind(_messaging, (event) {
//         print(">>>>>>>>step2 onsending");
//         // if (event != null) {
//         //   _pusherData.sink.add(SocketResult<SocketMessage>(
//         //   _pusherData.sink.add(
//         //       {"data":socketResult.toJson().toString(),"User Id":"1"});
//         //_channel!.trigger(_messaging, socketResult.toJson().toString());
//           //     SocketResult(
//           //  // type: ChannelType.message,
//           //   type: "message",
//           //   //me: me.toString(),
//           //   data: SocketMessage.fromJson(jsonDecode(event.data!)),
//           // ));
//      //   }
//         print(">>>>>>>>step2 sending");
//       });
//
//       // _channel!.bind(_notifications, (event) {
//       //   if (event != null) {
//       //     _pusherData.sink.add(SocketResult<SocketNotification>(
//       //       type: ChannelType.notification,
//       //       me: me,
//       //       data: SocketNotification.fromJson(jsonDecode(event.data!)),
//       //     ));
//       //   }
//       // });
//   //  }
//   }
//
//   void disconnect() async {
//     _pusherData.close();
//
//     if (_pusher != null) {
//       if (_channel != null) {
//         await _channel!.unbind(_messaging);
//         await _channel!.unbind(_notifications);
//       }
//       if (_channelName != null) {
//         await _pusher!.unsubscribe(_channelName!);
//       }
//       await _pusher!.disconnect();
//     }
//   }
  // String _getToken1() {
  //   return 'qwertyuiop1';
  //     // locator<SharedPreferencesManager>()
  //     //   .getString(SharedPreferencesManager.accessToken) ??
  //     //   '';
  // }
  // String _getToken2() {
  //   return 'qwertyuiop2';
  //   // locator<SharedPreferencesManager>()
  //   //   .getString(SharedPreferencesManager.accessToken) ??
  //   //   '';
  // }
// }

import 'dart:async';
import 'dart:convert';


import 'package:advertisers/app_core/network/models/MessageChatModel.dart';
import 'package:pusher_client/pusher_client.dart';

class AppPusher {
  static final _appPusher = AppPusher._internal();

  AppPusher._internal();

  factory AppPusher() {
    return _appPusher;
  }

  final String _messaging = 'ChatSent';
  //final String _notifications = 'notifications';

  PusherClient? _pusher;

  Channel? _channel;
  String? _channelName;

  final _pusherData = StreamController<MessageChatModel>.broadcast();
  Stream<MessageChatModel> get stream => _pusherData.stream;

  void connect({required String room}) {
   /// if (_pusher == null) {
      //  final token = _getToken();

      _pusher = PusherClient(
        '70f6cb19fc623a48094a',
        PusherOptions(
          cluster:'eu',
          encrypted: true,
          // auth: PusherAuth(
          //   AppSettings.pusher.url,
          //   headers: {'Authorization': 'Bearer $token'},
          // ),
        ),
        autoConnect: true,
        enableLogging: true,
      );

      //_channelName = 'private-user-${me.id}';
      _channelName = "chat-"+room;
      _channel = _pusher!.subscribe(_channelName!);

      _channel!.bind(_messaging, (event) {
        //if (event != null) {
          print("XXXXXXXXXXXXXXXXXXXXXXXXX${event?.data}");
          if (!_pusherData.isClosed){

          }
          _pusherData.sink.add(
              MessageChatModel.fromJson(jsonDecode(event?.data??' '))
              //MessageChatModel(

            // //type: ChannelType.message,
            // me: "ali",
            // data: MessageChatModel.fromJson(jsonDecode(event.data!)),
          //)
        );
       // }
      });

      //   _channel!.bind(_notifications, (event) {
      //     if (event != null) {
      //       _pusherData.sink.add(SocketResult<SocketNotification>(
      //         type: ChannelType.notification,
      //         me: me,
      //         data: SocketNotification.fromJson(jsonDecode(event.data!)),
      //       ));
      //     }
      //   });
      // }
    }
 // }
     void disconnect() async {
      _pusherData.close();

      if (_pusher != null) {
        if (_channel != null) {
          await _channel!.unbind(_messaging);
         // await _channel!.unbind(_notifications);
        }
        if (_channelName != null) {
          await _pusher!.unsubscribe(_channelName!);
        }
        await _pusher!.disconnect();
      }
    }

    // String _getToken() {
    //   return locator<SharedPreferencesManager>()
    //       .getString(SharedPreferencesManager.accessToken) ??
    //       '';
    // }
 }