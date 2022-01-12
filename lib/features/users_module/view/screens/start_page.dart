

import 'package:advertisers/features/users_module/view/screens/splash_screen.dart';
import 'package:advertisers/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';


class StartPage extends StatelessWidget {
  StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashScreen(
        seconds: 5,
        navigateAfterSeconds: storage.read("data")!=null? '/Home': '/loginPage' ,
        imageBackground: const NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQzN_8uDZyut3RXDqmygVIJ-a8kSa5_Cy4ucMLK5NeGsOet_e5ys8-_4_1K1f_aBx9YlBk&usqp=CAU'),
       // image: Image.asset('asset/images.jpeg'),

        //title: new Text('Welcome In SplashScreen'),
        //image: new Image.asset('screenshot.png'),
        backgroundColor: Colors.white,
        // styleTextUnderTheLoader: new TextStyle(),
        photoSize: 200.0,
        //loaderColor: Colors.red
      ),
    );
  }
}
