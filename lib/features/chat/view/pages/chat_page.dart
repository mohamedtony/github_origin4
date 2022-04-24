import 'dart:convert';
import 'dart:io';
import 'dart:math' as math;
import 'package:advertisers/app_core/network/requests/MessageChatModelRequest.dart';
import 'package:advertisers/features/chat/view/widgets/AudioChatMessage.dart';
import 'package:lecle_downloads_path_provider/lecle_downloads_path_provider.dart';
import 'package:location/location.dart'as location;
import 'package:advertisers/features/chat/view/pages/LocationShare.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:advertisers/app_core/network/models/FromUserModel.dart';
import 'package:advertisers/app_core/network/models/ListChatModel.dart';
import 'package:advertisers/app_core/network/models/MessageChatModel.dart';
import 'package:advertisers/app_core/network/models/ToUserModel.dart';
import 'package:advertisers/features/chat/controller/AppPusher.dart';
import 'package:advertisers/features/chat/controller/chat_controller.dart';
import 'package:advertisers/features/chat/controller/chat_messages_controller.dart';
import 'package:advertisers/features/chat/view/widgets/chat_and_title.dart';
import 'package:advertisers/features/chat/view/widgets/chat_content_widget.dart';
import 'package:advertisers/main.dart';
import 'package:advertisers/shared/advertisers_appbar/advertisers_app_bar.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:quds_popup_menu/quds_popup_menu.dart';
import 'package:record/record.dart';
import 'package:record_mp3/record_mp3.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import 'package:social_media_recorder/audio_encoder_type.dart';
import 'package:social_media_recorder/screen/social_media_recorder.dart';
class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  String statusText = "";
  Record _audioRecorder = Record();
  bool isComplete = false;
  bool isRecordTapped=false;
 // ScrollController _scrollController = new ScrollController();
  ChatMessagesController _chatMessagesController=Get.put(ChatMessagesController());
  final _pusher=AppPusher();
  int charactersLength=0;

  ImagePicker _imagePicker = ImagePicker();
  late  String room;
  String downloadsPath1='unknown';
  var  _streamSubscription;
  TextEditingController chatMessageController=TextEditingController();
   ItemScrollController itemScrollController = ItemScrollController();
  @override
  void initState() {
     room=Get.parameters['room'].toString();
    _pusher.connect(room:room);
     initDownloadsDirectoryPath();
    _streamSubscription = _pusher.stream.listen((event) {
     // print(">>>>>>>>>>>>>>>${event.data?.imageUrl}"
setState(() {
      FromUserModel fromUserModel=FromUserModel.fromJson(jsonDecode(Get.parameters["from_user"]??''));
      ToUserModel toUserModel=ToUserModel.fromJson(jsonDecode(Get.parameters["to_user"]??''));
    print (">>>>>>>>>>>>>>>>>>>>>${event.type}");
      FromUserModel? from;
       ToUserModel?   to;
      if(fromUserModel.toString()==storage.read("id",).toString()){
        from=FromUserModel.fromJson(jsonDecode(Get.parameters["from_user"]??''));
        to=ToUserModel.fromJson(jsonDecode(Get.parameters["to_user"]??''));
      }else if(toUserModel.id.toString()==storage.read("id",).toString()){
        from=FromUserModel.fromJson(jsonDecode(Get.parameters["to_user"]??''));
        to=ToUserModel.fromJson(jsonDecode(Get.parameters["from_user"]??''));
      }
      //  if(event.type=='text') {
        if (event.from_user_id == storage.read("id")) {
          _chatMessagesController.messagesChat.add(ListChatModel(
              message_type: event.type,
              message: event.message,
              to_user: to,
              from_user: from,
              from_me: true,
              room: room,
              //id:event.));
              id: int.parse(Get.parameters["id"].toString())));
        } else {
          _chatMessagesController.messagesChat.add(ListChatModel(
              message_type: event.type,
              message: event.message,
              to_user: to,
              from_user: from,
              from_me: false,
              room: room,
              id: int.parse(Get.parameters["id"].toString())));
        }
     // }else if(event.type=='sound'){


    //  }
});
      });


    super.initState();
  }
  Future<void> initDownloadsDirectoryPath() async {
    String downloadsPath=' ';
    try {
      downloadsPath = (await DownloadsPath.downloadsDirectory())?.path ??
          "Downloads path doesn't exist";

      // var dirType = DownloadDirectoryTypes.dcim;
      // downloadsPath = (await DownloadsPath.downloadsDirectory(dirType: dirType))?.path ?? "Downloads path doesn't exist";
    } catch (e) {
      downloadsPath = 'Failed to get downloads paths';
    }

    if (!mounted) return;

    setState(() {
      downloadsPath1 = downloadsPath;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Obx(()=>Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(75),
        child: AppBarWidget(

          isSearchBar: false,isNotification:true,isBack: false,
            // showSearch: false,
            ),
      ),
      body: SizedBox(
        height: 812.h,
        width: 375.w,
        child: ListView(
          children: [
            SizedBox(
              // height:60,
              width: 375.w,
              child: ChatAndTitle(
                show: Show.content,
                name: _chatMessagesController.messagesChat.isNotEmpty?_chatMessagesController.messagesChat[0].to_user?.username??' ':' ',
                image: _chatMessagesController.messagesChat.isNotEmpty?_chatMessagesController.messagesChat[0].to_user?.image??' ':' ',

              ),
            ),
            Stack(
              alignment: Alignment.center,fit: StackFit.passthrough,
              children: [

                SizedBox(
height: 812.h-133,
                  child:
                  SmartRefresher(
    controller: _chatMessagesController.refreshController,
    enablePullUp: true,
    onRefresh: () async {
    final result = await _chatMessagesController.getMessagesList(isRefresh: true,room: room);
    if (result) {
    _chatMessagesController.refreshController.refreshCompleted();
    } else {
    _chatMessagesController.refreshController.refreshFailed();
    }
    },
    onLoading: () async {
    final result = await _chatMessagesController.getMessagesList(room: room);
    if (result) {
    _chatMessagesController.refreshController.loadComplete();
    } else {
    //_chatMessagesController.refreshController.loadFailed();
    }
    },
    child:SizedBox(
          height: 812.h-200,
      child: ScrollablePositionedList.builder(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      physics: const BouncingScrollPhysics(),
        itemScrollController: itemScrollController,
             // controller: _scrollController,
              itemCount: _chatMessagesController.messagesChat.length,
              itemBuilder: (context, index) {

              if(_chatMessagesController.messagesChat[index].from_me==false&&_chatMessagesController.messagesChat[index].message_type=='text'){
                       return ChatContentWidget(
                         key: ValueKey(_chatMessagesController.messagesChat[index]),
                          chatUser: ChatUser.receiver,index: index,itemScrollController:itemScrollController,
                          message: _chatMessagesController.messagesChat[index],
                          type: 'text',
                         chatMessagesController:_chatMessagesController ,downloadsPath:downloadsPath1
                          //message: 'السلام عليكم',
                        );}else if(_chatMessagesController.messagesChat[index].from_me==true&&_chatMessagesController.messagesChat[index].message_type=='text') {
                return ChatContentWidget(
                  key: ValueKey(_chatMessagesController.messagesChat[index]),
                  chatUser: ChatUser.sender,itemScrollController:itemScrollController,
                  message: _chatMessagesController.messagesChat[index],
                  type: 'text',index: index,
                  chatMessagesController:_chatMessagesController ,downloadsPath:downloadsPath1
                  // message: 'عليكم السلام ورحمة الله وبركاته',
                );
              }else if(_chatMessagesController.messagesChat[index].from_me==false&&(_chatMessagesController.messagesChat[index].message_type=='sound'||_chatMessagesController.messagesChat[index].message_type=='audio')){
                return ChatContentWidget(
                  key: ValueKey(_chatMessagesController.messagesChat[index]),
                  chatUser: ChatUser.receiver,index: index,itemScrollController:itemScrollController,
                  message: _chatMessagesController.messagesChat[index],
                  type: 'sound',chatMessagesController:_chatMessagesController ,downloadsPath:downloadsPath1
                  // message: 'عليكم السلام ورحمة الله وبركاته',
                );
              }else if(_chatMessagesController.messagesChat[index].from_me==true&&(_chatMessagesController.messagesChat[index].message_type=='sound'||_chatMessagesController.messagesChat[index].message_type=='audio')){
                return ChatContentWidget(
                  key: ValueKey(_chatMessagesController.messagesChat[index]),
                  chatUser: ChatUser.sender,index: index,itemScrollController:itemScrollController,
                  message: _chatMessagesController.messagesChat[index],
                  type: 'sound',chatMessagesController:_chatMessagesController ,downloadsPath:downloadsPath1
                  // message: 'عليكم السلام ورحمة الله وبركاته',
                );
              }else if(_chatMessagesController.messagesChat[index].from_me==false&&(_chatMessagesController.messagesChat[index].message_type=='photo'||_chatMessagesController.messagesChat[index].message_type=='image')){
                return ChatContentWidget(
                  key: ValueKey(_chatMessagesController.messagesChat[index]),
                  chatUser: ChatUser.receiver,index: index,itemScrollController:itemScrollController,
                  message: _chatMessagesController.messagesChat[index],
                  type: 'image',
                  chatMessagesController:_chatMessagesController ,downloadsPath:downloadsPath1
                  // message: 'عليكم السلام ورحمة الله وبركاته',
                );
              }else if(_chatMessagesController.messagesChat[index].from_me==true&&(_chatMessagesController.messagesChat[index].message_type=='photo'||_chatMessagesController.messagesChat[index].message_type=='image')){
                return ChatContentWidget(
                  key: ValueKey(_chatMessagesController.messagesChat[index]),
                  chatUser: ChatUser.sender,index: index,itemScrollController:itemScrollController,
                  message: _chatMessagesController.messagesChat[index],
                  type: 'image',
                  chatMessagesController:_chatMessagesController ,downloadsPath:downloadsPath1
                  // message: 'عليكم السلام ورحمة الله وبركاته',
                );
              }else if(_chatMessagesController.messagesChat[index].from_me==false&&_chatMessagesController.messagesChat[index].message_type=='location'){
                return ChatContentWidget(
                  key: ValueKey(_chatMessagesController.messagesChat[index]),
                  chatUser: ChatUser.receiver,index: index,itemScrollController:itemScrollController,
                  message: _chatMessagesController.messagesChat[index],
                  type: 'location',
                  chatMessagesController:_chatMessagesController ,downloadsPath:downloadsPath1
                  // message: 'عليكم السلام ورحمة الله وبركاته',
                );
              }else if(_chatMessagesController.messagesChat[index].from_me==true&&_chatMessagesController.messagesChat[index].message_type=='location'){
                return ChatContentWidget(
                  key: ValueKey(_chatMessagesController.messagesChat[index]),
                  chatUser: ChatUser.sender,index: index,itemScrollController:itemScrollController,
                  message: _chatMessagesController.messagesChat[index],
                  type: 'location',
                  chatMessagesController:_chatMessagesController ,downloadsPath:downloadsPath1
                  // message: 'عليكم السلام ورحمة الله وبركاته',
                );
              }else if(_chatMessagesController.messagesChat[index].from_me==false&&_chatMessagesController.messagesChat[index].message_type=='video'){
                return ChatContentWidget(
                  key: ValueKey(_chatMessagesController.messagesChat[index]),
                  chatUser: ChatUser.receiver,index: index,itemScrollController:itemScrollController,
                  message: _chatMessagesController.messagesChat[index],
                  type: 'video',
                  chatMessagesController:_chatMessagesController ,downloadsPath:downloadsPath1
                  // message: 'عليكم السلام ورحمة الله وبركاته',
                );
              }else if(_chatMessagesController.messagesChat[index].from_me==true&&_chatMessagesController.messagesChat[index].message_type=='video'){
                return ChatContentWidget(
                  key: ValueKey(_chatMessagesController.messagesChat[index]),
                  chatUser: ChatUser.sender,index: index,itemScrollController:itemScrollController,
                  message: _chatMessagesController.messagesChat[index],
                  type: 'video',
                  chatMessagesController:_chatMessagesController ,downloadsPath:downloadsPath1
                  // message: 'عليكم السلام ورحمة الله وبركاته',
                );
              }
              return SizedBox();
              },

      ),
    )),
                ),
                // Positioned(
                //   top:0,
                //   child: SizedBox(
                //    // height:60,
                //     width: 375.w,
                //     child: ChatAndTitle(
                //       show: Show.content,
                //       name: _chatMessagesController.messagesChat.isNotEmpty?_chatMessagesController.messagesChat[0].to_user?.username??' ':' ',
                //       image: _chatMessagesController.messagesChat.isNotEmpty?_chatMessagesController.messagesChat[0].to_user?.image??' ':' ',
                //
                //     ),
                //   ),
                // ),
                Positioned(
                  bottom:0,
                  child: SizedBox(
                   width: 375.w,
                    height:60,
                    // padding: const EdgeInsets.all(4),
                    // color: Color(0xff4187cd),
                    child: Container(
                      width: 375.w,
                      padding: const EdgeInsets.all(3),
                      color: Color(0xff4187cd),
                      child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          // InkWell(
                          //   onTap: () {
                          //
                          //   },
                          //   child: SvgPicture.asset(
                          //     "images/ios-mic.svg",
                          //     height: 60,
                          //     color: Colors.white,
                          //   ),
                          // ),
                          Padding(
                            padding: EdgeInsets.only(top:0.0,right:7.w),
                            child:isRecordTapped==false?InkWell(
                                 onTap: (){
                                   startRecord();
                                   setState(() {
                                     isRecordTapped=true;
                                   });
                                 },

                                // SocialMediaRecorder(
                                //   sendRequestFunction: (soundFile) async{
                                // print('>>>>>>>>>>>>>>>>>>>>>>>>>>>${soundFile
                                //     .path}');
                                //
                                //
                                // _chatMessagesController.uploadFile(
                                //     room: room, type: "sound", file: await dio
                                //     .MultipartFile.fromFile(soundFile.path,
                                //     filename: soundFile.path
                                //         .substring(soundFile.path.lastIndexOf(
                                //         "/") + 1)));
                                //   },
                                //   backGroundColor:const Color(0xff4187cd),
                                //  recordIcon:const Icon(Icons.mic,color: Colors.white,),
                                //   //encode: AudioEncoderType.AAC
                                // ),
                               child: Icon(Icons.mic,color: Colors.white,),

                              ):InkWell(
                            onTap:()async{
                              stopRecord().then((value)async {
                                if(value==true) {
                                  _chatMessagesController.uploadFile(
                                      room: room,
                                      type: "sound",
                                      file:dio.MultipartFile.fromBytes(await File(recordFilePath??'').readAsBytes(),
                                      // await dio
                                      //     .MultipartFile.fromFile(
                                      //     recordFilePath ?? '',
                                          filename: recordFilePath
                                              ?.substring(
                                              recordFilePath?.lastIndexOf(
                                                  "/") ?? 0 + 1)),
                                      itemScrollController: itemScrollController);
                                }});


                            },
                              child: Icon(Icons.pause,color: Colors.red,),
                          )),
                          InkWell(
                            onTap: ()async {

                              final XFile? file = await _imagePicker.pickImage(source: ImageSource.camera);

                              // await _imagePicker
                              //     .pickImage(
                              //     source: ImageSource.camera,
                              //     // imageQuality: 60,
                              //     // maxWidth: 1280,
                              //     // maxHeight: 720
                              // )
                              //     .then((file) async {
                               // _chatMessagesController.file.value= File.fromUri(Uri.file(file!.path));
                               //  _chatMessagesController.savedFile.value =
                               //      File.fromUri(Uri.file(file!.path));
                                // RegisterNewClientUserController.photo =
                                // await dio.MultipartFile.fromFile(file.path,
                                //     filename: file.path
                                //         .substring(file.path.lastIndexOf("/") + 1));


                                // ChatMessagesController.photo =
                                // await dio.MultipartFile.fromFile(file!.path,
                                //     filename: file.path
                                //         .substring(file.path.lastIndexOf("/") + 1));

                                //         provider = FileImage(savedFile);


                                //         setState(()
                                //         {

                                // _chatMessagesController.imageBase641.value =
                                //     base64Encode(_chatMessagesController
                                //         .savedFile.value
                                //         .readAsBytesSync());

                                //           file1=multi1;
                                //         });
                                //
                              _chatMessagesController.uploadFile(room: room,type: "image",file: await dio.MultipartFile.fromFile(file!.path,
                                  filename: file.path
                                      .substring(file.path.lastIndexOf("/") + 1)),itemScrollController:itemScrollController);
                                // FromUserModel fromUserModel=FromUserModel.fromJson(jsonDecode(Get.parameters["from_user"]??''));
                                // ToUserModel toUserModel=ToUserModel.fromJson(jsonDecode(Get.parameters["to_user"]??''));
                                //ToUserModel toUserModel=json.decode(Get.parameters["to_user"]??"");
                                // _chatMessagesController.sendMessage(MessageChatModel(room: room,message:,type: "image",
                                //     from_user_id: fromUserModel.id,
                                //     to_user_id: toUserModel.id.toString()));
                             // });
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(left:0.0,bottom: 10,top: 13,),
                              child:SvgPicture.asset(
                                    "images/chatCamera.svg",
                                    height: 35,width: 35,
                                    color: Colors.white,fit: BoxFit.fitWidth,
                                  ), //Icon(Icons.camera_alt_outlined,color: Colors.white,),
                            )
                            // SvgPicture.asset(
                            //   "images/camera.svg",
                            //   height: 50,
                            //   color: Colors.white,
                            // ),
                          ),
                          SizedBox(width: 244.w,),
                          // SizedBox(
                          //    width: 244.w,
                          //    height: 45,
                          //   child: ClipRRect(
                          //     borderRadius: BorderRadius.circular(20),
                          //     child: Card(
                          //       color: Colors.grey[200],
                          //       clipBehavior: Clip.antiAlias,
                          //       elevation: 3,
                          //       shape: const RoundedRectangleBorder(
                          //         borderRadius: BorderRadius.all(
                          //           Radius.circular(25.0),
                          //         ),
                          //       ),
                          //       child:
                          //       // Column(
                          //       //   children: [
                          //       //     _chatMessagesController.replied.value==true?
                          //       //         Container(
                          //       //           decoration:BoxDecoration(
                          //       //             border: Border.all(color: Colors.blueAccent),
                          //       //             borderRadius: BorderRadius.circular(15),
                          //       //           ),
                          //       //           child: _chatMessagesController.messagesChat[_chatMessagesController.repliedIndex.value].message_type=='text'?Column(
                          //       //             children: [
                          //       //               _chatMessagesController.messagesChat[_chatMessagesController.repliedIndex.value].from_me==true?Text('you'):Text(_chatMessagesController.messagesChat[_chatMessagesController.repliedIndex.value].from_user?.username??' '),
                          //       //               Text(_chatMessagesController.messagesChat[_chatMessagesController.repliedIndex.value].message??' '),
                          //       //             ],
                          //       //           ):
                          //       //           _chatMessagesController.messagesChat[_chatMessagesController.repliedIndex.value].message_type=='sound'?const Text('Voice Message'):_chatMessagesController.messagesChat[_chatMessagesController.repliedIndex.value].message_type=='video'?
                          //       //           const Text('Video Message'):_chatMessagesController.messagesChat[_chatMessagesController.repliedIndex.value].message_type=='location'? const Text('Video Message'):const SizedBox()
                          //       //         ):const SizedBox(),
                          //           RawKeyboardListener(
                          //             focusNode: FocusNode(),
                          //             onKey: (event) {
                          //              // if(event.isKeyPressed(LogicalKeyboardKey.enter)) {
                          //                // if()
                          //                 // int cursorPos = chatMessage.selection.base.offset;
                          //                 // chatMessage.text = chatMessage + '\n' + textFin;
                          //                 // chatMessage.selection = TextSelection.fromPosition(TextPosition(offset: cursorPos + 1));
                          //               //}
                          //               },
                          //
                          //             child: TextFormField(
                          //               // enabled: false,
                          //               maxLines: 30,
                          //               onTap: (){
                          //                 SchedulerBinding.instance?.addPostFrameCallback((_) {
                          //                   _scrollController.animateTo(
                          //                       _scrollController.position.maxScrollExtent,
                          //                       duration: const Duration(milliseconds: 300),
                          //                       curve: Curves.fastOutSlowIn);
                          //                 });
                          //               },
                          //               keyboardType: TextInputType.multiline,
                          //               style: TextStyle(fontSize: 13.sp),
                          //               textAlign: Get.locale?.languageCode ==
                          //                   const Locale('en').languageCode
                          //                   ? TextAlign.left
                          //                   : TextAlign.right,
                          //               onChanged: (val){
                          //                 setState(() {
                          //                   charactersLength=val.length;
                          //                 });
                          //
                          //               },
                          //               controller: chatMessageController,
                          //               // keyboardType: TextInputType.text,
                          //               decoration: InputDecoration(
                          //                 hintText: '..............',
                          //                 contentPadding:  EdgeInsets.symmetric(vertical: 2.0,horizontal: 5.w),
                          //                 border: InputBorder.none,
                          //                 focusedBorder: InputBorder.none,
                          //                 enabledBorder: InputBorder.none,
                          //                 errorBorder: InputBorder.none,
                          //                 disabledBorder: InputBorder.none,
                          //                 // isDense: true,
                          //                 // contentPadding: EdgeInsets.all(0),
                          //                 // suffixIcon: Padding(
                          //                 //   padding: const EdgeInsets.all(12.0),
                          //                 //   child: InkWell(
                          //                 //     onTap: () {},
                          //                 //     child: SvgPicture.asset(
                          //                 //       "images/bx-search-alt.svg",
                          //                 //       height: 10,
                          //                 //     ),
                          //                 //   ),
                          //                 // ),
                          //
                          //                 suffixIcon: Padding(
                          //                   padding: const EdgeInsets.all(0.0),
                          //                   child: InkWell(
                          //                     onTap: () {
                          //                       FromUserModel fromUserModel=FromUserModel.fromJson(jsonDecode(Get.parameters["from_user"]??''));
                          //                       ToUserModel toUserModel=ToUserModel.fromJson(jsonDecode(Get.parameters["to_user"]??''));
                          //                       //ToUserModel toUserModel=json.decode(Get.parameters["to_user"]??"");
                          //                       _chatMessagesController.sendMessage(MessageChatModel(room: room,message:chatMessageController.text,type: "text",
                          //                       from_user_id: fromUserModel.id,
                          //                           to_user_id: toUserModel.id.toString()));
                          //                       // _chatMessagesController.messagesChat.add(ListChatModel(message: chatMessageController.text,room: room,from_me: true,
                          //                       // from_user:fromUserModel,
                          //                       //     to_user: toUserModel,
                          //                       //     message_type: "text",id:int.parse(Get.parameters["id"].toString()) ));
                          //                     },
                          //                     child: Transform(
                          //                       alignment: Alignment.center,
                          //                       transform: Matrix4.rotationY(
                          //                           Get.locale?.languageCode ==
                          //                               const Locale('en').languageCode
                          //                               ? math.pi
                          //                               : 0),
                          //                       child: SvgPicture.asset(
                          //                         "images/send.svg",
                          //                         height: 30,
                          //
                          //                       ),
                          //                     ),
                          //                   ),
                          //                 ),
                          //                 filled: true,
                          //                 fillColor: Colors.white,
                          //                 hintStyle: TextStyle(
                          //                     color: const Color(
                          //                       0xffA5A5A5,
                          //                     ),
                          //                     fontSize: 15.sp),
                          //               ),
                          //               // controller: _walletController.searchController,
                          //               // onSaved: (value){
                          //               //   _walletController.search=value!;
                          //               // },
                          //               // validator: (value){
                          //               //   return _walletController.validatePhone(value!);
                          //               // },
                          //             ),
                          //         //   ),
                          //         // ],
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding:  EdgeInsets.only(left:3.0.w,right: 10.w),
                              child: QudsPopupButton(
                                // backgroundColor: Colors.red,
                                  tooltip: 'T',
                                  items: getMenuItems(),
                                  child: const Icon(
                                        Icons.add,
                                        color: Colors.white,
                                        size: 35,
                                      ),),
                            ),
                          ),
                          // IconButton(
                          //   onPressed: () {},
                          //   icon: const Icon(
                          //     Icons.add,
                          //     color: Colors.white,
                          //     size: 35,
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 8,
                  left: 45.w,
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    height: _chatMessagesController.replied.value==true?150:45,
                    width: 244.w,

                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(25),
                      color: Colors.white,),
                    // height: 45.h,
                    child: SizedBox(
                     //height: 150,
                      width: 244.w,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          _chatMessagesController.replied.value==true?
                          Container(
                            width:244.w,
                            height: 100,

                              decoration:BoxDecoration(
                               // border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.transparent
                              ),
                              child:  _chatMessagesController.typeOfMessage.value=='text'?Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  height: 150,
                                  width: 244.w,
                                    decoration:BoxDecoration(
                                      // border: Border.all(color: Colors.black),
                                      // color: Colors.lightBlueAccent,
                                        color: const Color(0xffE8E8E8),
                                      borderRadius: BorderRadius.circular(25)),

                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 4.0),
                                        child: Container(
                                          width: 10,
                                          height: 140,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(topRight: Radius.circular(25),bottomRight: Radius.circular(25)),
                                            color: Colors.indigo,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width:220.w,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Align(
                                              alignment:Alignment.centerLeft,
                                              child: InkWell(
                                                onTap: (){
                                                  _chatMessagesController.replied.value=false;
                                                },
                                                child: Padding(
                                                  padding: const EdgeInsets.only(left:8.0,right: 8.0,top: 5),
                                                  child: SvgPicture.asset('images/baseline-clear-24px.svg',height :19,width:19,color:Colors.black),
                                                ),
                                              ),
                                            ),
                                            _chatMessagesController.messagesChat[_chatMessagesController.chatIndex.value].from_me==true?Text('you'):Text(_chatMessagesController.messagesChat[_chatMessagesController.chatIndex.value].from_user?.username??' '),
                                            Text(_chatMessagesController.messagesChat[_chatMessagesController.chatIndex.value].message??' ',overflow: TextOverflow.ellipsis,),
                                          ],
                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                              ):
                              _chatMessagesController.messagesChat[_chatMessagesController.chatIndex.value].message_type=='sound'||_chatMessagesController.messagesChat[_chatMessagesController.chatIndex.value].message_type=='audio'?Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  height: 150,
                                  width: 244.w,
                                  decoration:BoxDecoration(
                                    // border: Border.all(color: Colors.black),
                                    // color: Colors.lightBlueAccent,
                                      color: const Color(0xffE8E8E8),
                                      borderRadius: BorderRadius.circular(25)),

                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 4.0),
                                        child: Container(
                                          width: 10,
                                          height: 140,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(topRight: Radius.circular(25),bottomRight: Radius.circular(25)),
                                            color: Colors.indigo,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width:220.w,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Align(
                                              alignment:Alignment.centerLeft,
                                              child: InkWell(
                                                onTap: (){
                                                  _chatMessagesController.replied.value=false;
                                                },
                                                child: Padding(
                                                  padding: const EdgeInsets.only(left:8.0,right: 8.0,top: 5),
                                                  child: SvgPicture.asset('images/baseline-clear-24px.svg',height :19,width:19,color:Colors.black),
                                                ),
                                              ),
                                            ),
                                            _chatMessagesController.messagesChat[_chatMessagesController.chatIndex.value].from_me==true?Text('you'):Text(_chatMessagesController.messagesChat[_chatMessagesController.chatIndex.value].from_user?.username??' '),
                                        Text("Voice Message"),
                                          ],
                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                              )



                              :_chatMessagesController.messagesChat[_chatMessagesController.chatIndex.value].message_type=='video'?
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  height: 150,
                                  width: 244.w,
                                  decoration:BoxDecoration(
                                    // border: Border.all(color: Colors.black),
                                    // color: Colors.lightBlueAccent,
                                      color: const Color(0xffE8E8E8),
                                      borderRadius: BorderRadius.circular(25)),

                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 4.0),
                                        child: Container(
                                          width: 10,
                                          height: 140,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(topRight: Radius.circular(25),bottomRight: Radius.circular(25)),
                                            color: Colors.indigo,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width:220.w,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Align(
                                              alignment:Alignment.centerLeft,
                                              child: InkWell(
                                                onTap: (){
                                                  _chatMessagesController.replied.value=false;
                                                },
                                                child: Padding(
                                                  padding: const EdgeInsets.only(left:8.0,right: 8.0,top: 5),
                                                  child: SvgPicture.asset('images/baseline-clear-24px.svg',height :19,width:19,color:Colors.black),
                                                ),
                                              ),
                                            ),
                                            _chatMessagesController.messagesChat[_chatMessagesController.chatIndex.value].from_me==true?Text('you'):Text(_chatMessagesController.messagesChat[_chatMessagesController.chatIndex.value].from_user?.username??' '),
                                            Text('Video Message'),
                                          ],
                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                              ):_chatMessagesController.messagesChat[_chatMessagesController.chatIndex.value].message_type=='location'? Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  height: 150,
                                  width: 244.w,
                                  decoration:BoxDecoration(
                                    // border: Border.all(color: Colors.black),
                                    // color: Colors.lightBlueAccent,
                                      color: const Color(0xffE8E8E8),
                                      borderRadius: BorderRadius.circular(25)),

                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 4.0),
                                        child: Container(
                                          width: 10,
                                          height: 140,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(topRight: Radius.circular(25),bottomRight: Radius.circular(25)),
                                            color: Colors.indigo,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width:220.w,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Align(
                                              alignment:Alignment.centerLeft,
                                              child: InkWell(
                                                onTap: (){
                                                  _chatMessagesController.replied.value=false;
                                                },
                                                child: Padding(
                                                  padding: const EdgeInsets.only(left:8.0,right: 8.0,top: 5),
                                                  child: SvgPicture.asset('images/baseline-clear-24px.svg',height :19,width:19,color:Colors.black),
                                                ),
                                              ),
                                            ),
                                            _chatMessagesController.messagesChat[_chatMessagesController.chatIndex.value].from_me==true?Text('you'):Text(_chatMessagesController.messagesChat[_chatMessagesController.chatIndex.value].from_user?.username??' '),
                                            Text('Location Message'),
                                          ],
                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                              ):const SizedBox(height: 0,)
                          ):const SizedBox(height:0,),
                          SizedBox(
                            height: 45,
                            child: RawKeyboardListener(
                              focusNode: FocusNode(),
                              onKey: (event) {
                                // if(event.isKeyPressed(LogicalKeyboardKey.enter)) {
                                // if()
                                // int cursorPos = chatMessage.selection.base.offset;
                                // chatMessage.text = chatMessage + '\n' + textFin;
                                // chatMessage.selection = TextSelection.fromPosition(TextPosition(offset: cursorPos + 1));
                                //}
                              },

                              child: Container(

                                decoration: BoxDecoration(
                                 // border: Border.all(color:Colors.blueAccent),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child:  ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Card(
                                        color: Colors.grey[200],
                                        clipBehavior: Clip.antiAlias,
                                        elevation: 0,
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(25.0),
                                          ),
                                        ),
                                  child: TextFormField(
                                    // enabled: false,
                                    maxLines: 30,
                                    onTap: (){
                                      SchedulerBinding.instance?.addPostFrameCallback((_) {
                                        // _scrollController.animateTo(
                                        //     _scrollController.position.maxScrollExtent,
                                        //     duration: const Duration(milliseconds: 300),
                                        //     curve: Curves.fastOutSlowIn);
                                      });
                                    },
                                    keyboardType: TextInputType.multiline,
                                    style: TextStyle(fontSize: 14.sp),
                                    textAlign: Get.locale?.languageCode ==
                                        const Locale('en').languageCode
                                        ? TextAlign.left
                                        : TextAlign.right,
                                    onChanged: (val){
                                      setState(() {
                                        charactersLength=val.length;
                                      });

                                    },
                                    controller: chatMessageController,
                                    // keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                      hintText: '..............',
                                      contentPadding:  EdgeInsets.symmetric(vertical: 2.0,horizontal: 10.w),
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      // isDense: true,
                                      // contentPadding: EdgeInsets.all(0),
                                      // suffixIcon: Padding(
                                      //   padding: const EdgeInsets.all(12.0),
                                      //   child: InkWell(
                                      //     onTap: () {},
                                      //     child: SvgPicture.asset(
                                      //       "images/bx-search-alt.svg",
                                      //       height: 10,
                                      //     ),
                                      //   ),
                                      // ),

                                      suffixIcon: Padding(
                                        padding: const EdgeInsets.all(0.0),
                                        child: InkWell(
                                          onTap: () {

                                            FromUserModel fromUserModel=FromUserModel.fromJson(jsonDecode(Get.parameters["from_user"]??''));
                                            ToUserModel toUserModel=ToUserModel.fromJson(jsonDecode(Get.parameters["to_user"]??''));
                                            // print(">>>>>>>>>>>>>>>>>>>>>>${fromUserModel.id}");
                                            // print(">>>>>>>>>>>>>>>>>>>>>>${toUserModel.id}");
                                            int? from,to;
                                            if(fromUserModel.toString()==storage.read("id",).toString()){
                                              from=fromUserModel.id??0;
                                              to=toUserModel.id??0;
                                            }else if(toUserModel.id.toString()==storage.read("id",).toString()){
                                              from=toUserModel.id??0;
                                              to=fromUserModel.id??0;
                                            }
                                            //ToUserModel toUserModel=json.decode(Get.parameters["to_user"]??"");
                                           if( _chatMessagesController.replied.value==false){
                                             _chatMessagesController.sendMessage(message:MessageChatModelRequest(room: room,message:chatMessageController.text,type: "text",
                                                from_user_id: from,
                                                to_user_id: to.toString()),itemScrollController:itemScrollController);
                                             chatMessageController.text='';
                                           }else{
                                              _chatMessagesController.sendMessage(message:MessageChatModelRequest(room: room,message:chatMessageController.text,type: "text",message_id: _chatMessagesController.messagesChat[_chatMessagesController.chatIndex.value].id,
                                                from_user_id: from,
                                                to_user_id: to.toString()),itemScrollController:itemScrollController);
                                              chatMessageController.text='';
                                           }
                                            // _chatMessagesController.messagesChat.add(ListChatModel(message: chatMessageController.text,room: room,from_me: true,
                                            // from_user:fromUserModel,
                                            //     to_user: toUserModel,
                                            //     message_type: "text",id:int.parse(Get.parameters["id"].toString()) ));
                                          },
                                          child: Transform(
                                            alignment: Alignment.center,
                                            transform: Matrix4.rotationY(
                                                Get.locale?.languageCode ==
                                                    const Locale('en').languageCode
                                                    ? math.pi
                                                    : 0),
                                            child: SvgPicture.asset(
                                              "images/send.svg",
                                              height: 30,

                                            ),
                                          ),
                                        ),
                                      ),
                                      filled: true,
                                      fillColor: Colors.white,
                                      hintStyle: TextStyle(
                                          color: const Color(
                                            0xffA5A5A5,
                                          ),
                                          fontSize: 15),
                                    ),
                                    // controller: _walletController.searchController,
                                    // onSaved: (value){
                                    //   _walletController.search=value!;
                                    // },
                                    // validator: (value){
                                    //   return _walletController.validatePhone(value!);
                                    // },
                                  )),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
  @override
  void dispose() {
    //_pusher.disconnect();
    super.dispose();
  }
  List<QudsPopupMenuBase> getMenuItems() {
    return [
      QudsPopupMenuItem(
          title: Text('مكتبة الصور والفيديوهات'),
          onPressed: (){
            showChoiceImageDialog(context);
          }),
      QudsPopupMenuItem(
          title: Text('مستندات الهاتف'),
          onPressed: ()async {
            FilePickerResult? result = await FilePicker.platform.pickFiles(allowedExtensions: ['pdf', 'doc'],type: FileType.custom,);

            if (result != null) {

               _chatMessagesController.uploadFile(room: room,type: "file",file: await dio.MultipartFile.fromFile(result.files.first.path??' ',
                  filename: result.files.first.path
                      ?.substring(result.files.first.path?.lastIndexOf("/")??0 + 1)),itemScrollController:itemScrollController);
              // _chatMessagesController.sendMessage(MessageChatModel(room: room,message:chatMessageController.text,type: "document",
              //     from_user_id: fromUserModel.id,
              //     to_user_id: toUserModel.id.toString()));
            } else {
              // User canceled the picker
            }
          }),
      QudsPopupMenuItem(
          title: Text('مشاركة موقع'),
          onPressed: () {
            FromUserModel fromUserModel=FromUserModel.fromJson(jsonDecode(Get.parameters["from_user"]??''));
            ToUserModel toUserModel=ToUserModel.fromJson(jsonDecode(Get.parameters["to_user"]??''));
            int? from,to;
            if(fromUserModel.toString()==storage.read("id",).toString()){
              from=fromUserModel.id??0;
              to=toUserModel.id??0;
            }else if(toUserModel.id.toString()==storage.read("id",).toString()){
              from=toUserModel.id??0;
              to=fromUserModel.id??0;
            }
            getLocation().then((value) {
              if(value!=null) {
                Get.to( LocationShare(latitude: value.latitude??0.0,longitude: value.longitude??0.0,
                room:room,fromUserId: from??0, toUserId: to.toString()));
              } });

          }),
      QudsPopupMenuItem(
          title: Text('اضافة جهةاتصال'),
          onPressed: () async{
            ToUserModel toUserModel=ToUserModel.fromJson(jsonDecode(Get.parameters["to_user"]??''));
    if (await FlutterContacts.requestPermission()) {
      //List<Contact> contacts = await FlutterContacts.getContacts();

      // Get all contacts (fully fetched)
      // contacts = await FlutterContacts.getContacts(
      //     withProperties: true, withPhoto: false);

      // Get contact with specific ID (fully fetched)
     // Contact? contact = await FlutterContacts.getContact(contacts.first.id);

      final newContact = Contact()
        ..name.first = toUserModel.username??' '
        //..name.last = 'Smith'
        ..phones = [Phone('555-123-4567')];
      await newContact.insert().then((value) {
        if(value.id!=null){
          Get.snackbar(
            "نجاح",
            "تمت الاضافة بنجاح",
            icon: const Icon(Icons.person, color: Colors.red),
            backgroundColor: Colors.yellow,
            snackPosition: SnackPosition.BOTTOM,);
        }else{
          Get.snackbar(
            "خطأ",
            "لم تتم الاضافة",
            icon: const Icon(Icons.person, color: Colors.red),
            backgroundColor: Colors.yellow,
            snackPosition: SnackPosition.BOTTOM,);
        }
      } );
            }
          }),
      ];}

  Future<void> showChoiceImageDialog(BuildContext context)
  {
    ImagePicker _imagePicker = ImagePicker();
    return showDialog(context: context,builder: (BuildContext context){

      return AlertDialog(
        title: Text("اختر",style: TextStyle(color: Colors.blue),),
        content: SingleChildScrollView(
          child: ListBody(
            children: [
              Divider(height: 1,color: Colors.blue,),
              ListTile(
                onTap: () async {
                  final XFile? file = await _imagePicker.pickImage(source: ImageSource.gallery);
      if (file != null) {
        _chatMessagesController.uploadFile(room: room,
            type: "image",
            file: await dio.MultipartFile.fromFile(file.path ??
                ' ',
                filename: file.path
                    ?.substring(file.path.lastIndexOf("/") ?? 0 + 1)),itemScrollController:itemScrollController);
        Navigator.pop(context);
      }},
                title: Text("صورة"),
                leading: Icon(Icons.account_box,color: Colors.blue,),
              ),

              Divider(height: 1,color: Colors.blue,),
              ListTile(
                onTap: ()async {
                  final XFile? file = await _imagePicker.pickVideo(source: ImageSource.gallery);
                  if (file != null) {
                    _chatMessagesController.uploadFile(room: room,
                        type: "video",
                        file: await dio.MultipartFile.fromFile(file.path ??
                            ' ',
                            filename: file.path
                                ?.substring(file.path.lastIndexOf("/") ?? 0 + 1)),itemScrollController:itemScrollController);
                    Navigator.pop(context);
                  }
                },
                title: Text("فيديو"),
                leading: Icon(Icons.camera,color: Colors.blue,),
              ),
            ],
          ),
        ),);
    });
  }

  Future<location.LocationData?> getLocation() async {
    location.Location myLocation = new location.Location();

    bool _serviceEnabled;
    location.PermissionStatus _permissionGranted;
    location.LocationData _locationData;

    _serviceEnabled = await myLocation.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await myLocation.requestService();
      if (!_serviceEnabled) {
        return null;
      }
    }

    _permissionGranted = await myLocation.hasPermission();
    if (_permissionGranted == location.PermissionStatus.denied) {
      _permissionGranted = await myLocation.requestPermission();
      if (_permissionGranted != location.PermissionStatus.granted) {
        return null;
      }
    }

    _locationData = await myLocation.getLocation();
    print("myLocation${_locationData.latitude}");
    return _locationData;
    // googleMapController.animateCamera(
    //   CameraUpdate.newCameraPosition(
    //     CameraPosition(target: LatLng(_locationData.latitude!, _locationData.longitude!),zoom: 15),
    //   ),
    // );
  }
  Future<bool> checkPermission() async {
    if (!await Permission.microphone.isGranted) {
      PermissionStatus status = await Permission.microphone.request();
      if (status != PermissionStatus.granted) {
        return false;
      }
    }
    return true;
  }
  int i = 0;

  Future<String> getFilePath() async {
    Directory storageDirectory = await getApplicationDocumentsDirectory();
    String sdPath = storageDirectory.path + "/record";
    var d = Directory(sdPath);
    if (!d.existsSync()) {
      d.createSync(recursive: true);
    }
    return sdPath + "/test_${DateTime.now().millisecondsSinceEpoch}.mp3";
  }
  String? recordFilePath='';
  void startRecord() async {
    bool hasPermission = await checkPermission();
    if (hasPermission) {
      statusText = "Recording...";
         recordFilePath = await getFilePath();
setState(() {
  isComplete = false;
});

      RecordMp3.instance.start(recordFilePath!, (type) {
        statusText = "Record error--->$type";
        setState(() {});
      });
    } else {
      statusText = "No microphone permission";
    }
    setState(() {});
    // return await getFilePath();
  }
 Future<bool>  stopRecord()async {
    bool? s = RecordMp3.instance.stop();
    if (s) {


      setState(() {
        isComplete = true;
      isRecordTapped = false;
      //isComplete=false;
      statusText = "Record complete";
      });

    }

    print("EEEEEEEEEEEEEEEEEEEEEEEEEEE${RecordMp3.instance.status}");
   return  Future.value(s);
  }
}
