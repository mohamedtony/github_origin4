import 'dart:convert';
import 'dart:io';
import 'dart:math' as math;
import 'package:advertisers/features/chat/view/widgets/AudioChatMessage.dart';
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
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:quds_popup_menu/quds_popup_menu.dart';
import 'package:social_media_recorder/audio_encoder_type.dart';
import 'package:social_media_recorder/screen/social_media_recorder.dart';
class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  ScrollController _scrollController = new ScrollController();
  ChatMessagesController _chatMessagesController=Get.put(ChatMessagesController());
  final _pusher=AppPusher();
  int charactersLength=0;
  ImagePicker _imagePicker = ImagePicker();
  late  String room;
  var  _streamSubscription;
  TextEditingController chatMessageController=TextEditingController();
  @override
  void initState() {
     room=Get.parameters['room'].toString();
    _pusher.connect(room:room);
    _streamSubscription = _pusher.stream.listen((event) {
     // print(">>>>>>>>>>>>>>>${event.data?.imageUrl}"
setState(() {
      FromUserModel fromUserModel=FromUserModel.fromJson(jsonDecode(Get.parameters["from_user"]??''));
      ToUserModel toUserModel=ToUserModel.fromJson(jsonDecode(Get.parameters["to_user"]??''));
    print (">>>>>>>>>>>>>>>>>>>>>${event.type}");

      //  if(event.type=='text') {
        if (event.from_user_id == storage.read("id")) {
          _chatMessagesController.messagesChat.add(ListChatModel(
              message_type: event.type,
              message: event.message,
              to_user: toUserModel,
              from_user: fromUserModel,
              from_me: true,
              room: room,
              id: int.parse(Get.parameters["id"].toString())));
        } else {
          _chatMessagesController.messagesChat.add(ListChatModel(
              message_type: event.type,
              message: event.message,
              to_user: toUserModel,
              from_user: fromUserModel,
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
  @override
  Widget build(BuildContext context) {
    return  Obx(()=>Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(75),
        child: AppBarWidget(

            // isSearchBar: ,
            // showSearch: false,
            ),
      ),
      body: SizedBox(
        height: 812.h-100,
        width: 375.w,
        child: Stack(
          alignment: Alignment.center,fit: StackFit.loose,
          children: [

            SizedBox(
height: 812.h-270,
              child: SmartRefresher(
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
    child:ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 20),
                physics: const BouncingScrollPhysics(),
        controller: _scrollController,
        itemCount: _chatMessagesController.messagesChat.length,
        itemBuilder: (context, index) {

        if(_chatMessagesController.messagesChat[index].from_me==false&&_chatMessagesController.messagesChat[index].message_type=='text'){
                 return ChatContentWidget(
                    chatUser: ChatUser.receiver,index: index,
                    message: _chatMessagesController.messagesChat[index],
                    type: 'text',
                   chatMessagesController:_chatMessagesController ,
                    //message: 'السلام عليكم',
                  );}else if(_chatMessagesController.messagesChat[index].from_me==true&&_chatMessagesController.messagesChat[index].message_type=='text') {
          return ChatContentWidget(
            chatUser: ChatUser.sender,
            message: _chatMessagesController.messagesChat[index],
            type: 'text',index: index,
            chatMessagesController:_chatMessagesController ,
            // message: 'عليكم السلام ورحمة الله وبركاته',
          );
        }else if(_chatMessagesController.messagesChat[index].from_me==false&&(_chatMessagesController.messagesChat[index].message_type=='sound'||_chatMessagesController.messagesChat[index].message_type=='audio')){
          return ChatContentWidget(
            chatUser: ChatUser.receiver,index: index,
            message: _chatMessagesController.messagesChat[index],
            type: 'sound',chatMessagesController:_chatMessagesController ,
            // message: 'عليكم السلام ورحمة الله وبركاته',
          );
        }else if(_chatMessagesController.messagesChat[index].from_me==true&&(_chatMessagesController.messagesChat[index].message_type=='sound'||_chatMessagesController.messagesChat[index].message_type=='audio')){
          return ChatContentWidget(
            chatUser: ChatUser.sender,index: index,
            message: _chatMessagesController.messagesChat[index],
            type: 'sound',chatMessagesController:_chatMessagesController ,
            // message: 'عليكم السلام ورحمة الله وبركاته',
          );
        }else if(_chatMessagesController.messagesChat[index].from_me==false&&(_chatMessagesController.messagesChat[index].message_type=='photo'||_chatMessagesController.messagesChat[index].message_type=='image')){
          return ChatContentWidget(
            chatUser: ChatUser.receiver,index: index,
            message: _chatMessagesController.messagesChat[index],
            type: 'image',
            chatMessagesController:_chatMessagesController ,
            // message: 'عليكم السلام ورحمة الله وبركاته',
          );
        }else if(_chatMessagesController.messagesChat[index].from_me==true&&(_chatMessagesController.messagesChat[index].message_type=='photo'||_chatMessagesController.messagesChat[index].message_type=='image')){
          return ChatContentWidget(
            chatUser: ChatUser.sender,index: index,
            message: _chatMessagesController.messagesChat[index],
            type: 'image',
            chatMessagesController:_chatMessagesController ,
            // message: 'عليكم السلام ورحمة الله وبركاته',
          );
        }else if(_chatMessagesController.messagesChat[index].from_me==false&&_chatMessagesController.messagesChat[index].message_type=='location'){
          return ChatContentWidget(
            chatUser: ChatUser.receiver,index: index,
            message: _chatMessagesController.messagesChat[index],
            type: 'location',
            chatMessagesController:_chatMessagesController ,
            // message: 'عليكم السلام ورحمة الله وبركاته',
          );
        }else if(_chatMessagesController.messagesChat[index].from_me==true&&_chatMessagesController.messagesChat[index].message_type=='location'){
          return ChatContentWidget(
            chatUser: ChatUser.sender,index: index,
            message: _chatMessagesController.messagesChat[index],
            type: 'location',
            chatMessagesController:_chatMessagesController ,
            // message: 'عليكم السلام ورحمة الله وبركاته',
          );
        }else if(_chatMessagesController.messagesChat[index].from_me==false&&_chatMessagesController.messagesChat[index].message_type=='video'){
          return ChatContentWidget(
            chatUser: ChatUser.receiver,index: index,
            message: _chatMessagesController.messagesChat[index],
            type: 'video',
            chatMessagesController:_chatMessagesController ,
            // message: 'عليكم السلام ورحمة الله وبركاته',
          );
        }else if(_chatMessagesController.messagesChat[index].from_me==true&&_chatMessagesController.messagesChat[index].message_type=='video'){
          return ChatContentWidget(
            chatUser: ChatUser.sender,index: index,
            message: _chatMessagesController.messagesChat[index],
            type: 'video',
            chatMessagesController:_chatMessagesController ,
            // message: 'عليكم السلام ورحمة الله وبركاته',
          );
        }
        return SizedBox();
        },

    )),
            ),
            Positioned(
              top:0,
              child: SizedBox(
               // height:60,
                width: 375.w,
                child: ChatAndTitle(
                  show: Show.content,
                  name: _chatMessagesController.messagesChat.isNotEmpty?_chatMessagesController.messagesChat[0].to_user?.username??' ':' ',
                  image: _chatMessagesController.messagesChat.isNotEmpty?_chatMessagesController.messagesChat[0].to_user?.image??' ':' ',

                ),
              ),
            ),
            Positioned(
              bottom:0,
              child: SizedBox(
               width: 375.w,
                height:60,
                // padding: const EdgeInsets.all(4),
                // color: Color(0xff4187cd),
                child: Container(
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
                        padding: const EdgeInsets.only(top:4.0,right: 8.5),
                        child: SocialMediaRecorder(
                          sendRequestFunction: (soundFile) async{
                            // print("the current path is ${soundFile.path}");
                            // dio.MultipartFile file=  await dio.MultipartFile.fromFile(soundFile.path,
                            //     filename: soundFile.path
                            //         .substring(soundFile.path.lastIndexOf("/") + 1));
                            _chatMessagesController.uploadFile(room: room,type: "sound",file:await dio.MultipartFile.fromFile(soundFile.path,
                                filename: soundFile.path
                                    .substring(soundFile.path.lastIndexOf("/") + 1)));
                          },
                          backGroundColor:const Color(0xff4187cd),
                         recordIcon:const Icon(Icons.mic,color: Colors.white,),
                          //encode: AudioEncoderType.AAC
                        ),
                      ),
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
                                  .substring(file.path.lastIndexOf("/") + 1)));
                            // FromUserModel fromUserModel=FromUserModel.fromJson(jsonDecode(Get.parameters["from_user"]??''));
                            // ToUserModel toUserModel=ToUserModel.fromJson(jsonDecode(Get.parameters["to_user"]??''));
                            //ToUserModel toUserModel=json.decode(Get.parameters["to_user"]??"");
                            // _chatMessagesController.sendMessage(MessageChatModel(room: room,message:,type: "image",
                            //     from_user_id: fromUserModel.id,
                            //     to_user_id: toUserModel.id.toString()));
                         // });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left:2.0,bottom: 10),
                          child: Icon(Icons.camera_alt_outlined,color: Colors.white,),
                        )
                        // SvgPicture.asset(
                        //   "images/camera.svg",
                        //   height: 50,
                        //   color: Colors.white,
                        // ),
                      ),
                      SizedBox(
                         width: 244.w,
                        // height: 45.h,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Card(
                            color: Colors.grey[200],
                            clipBehavior: Clip.antiAlias,
                            elevation: 3,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(25.0),
                              ),
                            ),
                            child:
                            // Column(
                            //   children: [
                            //     _chatMessagesController.replied.value==true?
                            //         Container(
                            //           decoration:BoxDecoration(
                            //             border: Border.all(color: Colors.blueAccent),
                            //             borderRadius: BorderRadius.circular(15),
                            //           ),
                            //           child: _chatMessagesController.messagesChat[_chatMessagesController.repliedIndex.value].message_type=='text'?Text(_chatMessagesController.messagesChat[_chatMessagesController.repliedIndex.value].message??' '):
                            //           _chatMessagesController.messagesChat[_chatMessagesController.repliedIndex.value].message_type=='sound'?const Text('Voice Message'):_chatMessagesController.messagesChat[_chatMessagesController.repliedIndex.value].message_type=='video'?
                            //           const Text('Video Message'):_chatMessagesController.messagesChat[_chatMessagesController.repliedIndex.value].message_type=='location'? const Text('Video Message'):const SizedBox()
                            //         ):const SizedBox(),
                                RawKeyboardListener(
                                  focusNode: FocusNode(),
                                  onKey: (event) {
                                   // if(event.isKeyPressed(LogicalKeyboardKey.enter)) {
                                     // if()
                                      // int cursorPos = chatMessage.selection.base.offset;
                                      // chatMessage.text = chatMessage + '\n' + textFin;
                                      // chatMessage.selection = TextSelection.fromPosition(TextPosition(offset: cursorPos + 1));
                                    //}
                                    },

                                  child: TextFormField(
                                    // enabled: false,
                                    maxLines: 30,
                                    onTap: (){
                                      SchedulerBinding.instance?.addPostFrameCallback((_) {
                                        _scrollController.animateTo(
                                            _scrollController.position.maxScrollExtent,
                                            duration: const Duration(milliseconds: 300),
                                            curve: Curves.fastOutSlowIn);
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
                                            //ToUserModel toUserModel=json.decode(Get.parameters["to_user"]??"");
                                            _chatMessagesController.sendMessage(MessageChatModel(room: room,message:chatMessageController.text,type: "text",
                                            from_user_id: fromUserModel.id,
                                                to_user_id: toUserModel.id.toString()));
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
                                          fontSize: 15.sp),
                                    ),
                                    // controller: _walletController.searchController,
                                    // onSaved: (value){
                                    //   _walletController.search=value!;
                                    // },
                                    // validator: (value){
                                    //   return _walletController.validatePhone(value!);
                                    // },
                                  ),
                                ),
                            //   ],
                            // ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left:8.0),
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

          ],
        ),
      ),
    ));
  }
  @override
  void dispose() {
    _pusher.disconnect();
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
                      ?.substring(result.files.first.path?.lastIndexOf("/")??0 + 1)));
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

            getLocation().then((value) {
              if(value!=null) {
                Get.to( LocationShare(latitude: value.latitude??0.0,longitude: value.longitude??0.0,
                room:room,fromUserId: fromUserModel.id??0, toUserId: toUserModel.id.toString()));
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
                    ?.substring(file.path.lastIndexOf("/") ?? 0 + 1)));
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
                                ?.substring(file.path.lastIndexOf("/") ?? 0 + 1)));
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
}
