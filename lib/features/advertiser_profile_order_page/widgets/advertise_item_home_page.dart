import 'package:advertisers/app_core/network/models/AdsListModel.dart';
import 'package:advertisers/app_core/network/models/GetAdvertisersModel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
//=========================================================================================

//                         By Mohamed T. Hammad

//=========================================================================================
class AdvertiseItem extends StatelessWidget {
  AdvertiseItem(this.adsListModel, {Key? key}) : super(key: key);
  AdsListModel adsListModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 6.0, bottom: 2.0),
      child: Stack(
        children: <Widget>[
          ShaderMask(
            shaderCallback: (rect) {
              return LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.black],
              ).createShader(
                  Rect.fromLTRB(0, 100, rect.width, rect.height - 1));
            },
            blendMode: BlendMode.darken,
            child: Container(
              height: 220.h,
              child: CachedNetworkImage(
                imageUrl: adsListModel.image != null ? adsListModel.image! : "",
                placeholder: (context, url) => const SpinKitThreeBounce(
                  color: Colors.grey,
                  size: 25,
                ),
                errorWidget: (context, url, error) =>  Container(
                  child: Image.asset("images/image_not_found.png",width: MediaQuery.of(context).size.width,
                  //height: 75.0,
                  fit: BoxFit.cover,),
                ),
                width: MediaQuery.of(context).size.width,
                //height: 75.0,
                fit: BoxFit.cover,
              ),
              /*decoration: BoxDecoration(
                image: DecorationImage(
                  image: Image('images/image1.jpg'),
                  fit: BoxFit.cover,
                ),
              ),*/
            ),
          ),
          Container(
            height: 220.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                    margin: EdgeInsets.only(right: 16.0),
                    child: Text('${adsListModel.time_ago ?? ''}',
                        style: TextStyle(color: Colors.white))),
                /*Container(
                  margin: EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      InkWell(
                          onTap: (){
                          Get.toNamed('/AdvertiserProfileOrderPage',arguments:GetAdvertisersModel(id: adsListModel.id));
                          },
                        child: new Container(
                            width: 50.0,
                            height: 50.0,
                            decoration: new BoxDecoration(
                                shape: BoxShape.circle,
                                image: adsListModel.user?.image != null &&
                                        adsListModel.user!.image!.isNotEmpty
                                    ? new DecorationImage(
                                        fit: BoxFit.cover,
                                        image: new NetworkImage(adsListModel.user!.image!))
                                    : new DecorationImage(
                                        fit: BoxFit.cover,
                                        image: new AssetImage(
                                            'images/image1.jpg')))),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 16.0),
                            child: Text(
                              adsListModel.user?.username??'',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 16.0.sp),
                            ),
                          ),
                          adsListModel.description!=null && adsListModel.description!.isNotEmpty? Container(
                            margin: EdgeInsets.only(right: 16.0),
                            child: Text(
                              adsListModel.description??'',
                              style: TextStyle(
                                  color: Colors.white70, fontSize: 14.0.sp),
                            ),
                          ):SizedBox()
                        ],
                      )
                    ],
                  ),
                ),*/
              ],
            ),
          ),
        ],
      ),
    );
  }
}
