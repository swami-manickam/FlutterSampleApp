import 'package:firstflutter/view/LoginPage.dart';
import 'package:flutter/material.dart';

import 'register_page.dart';

class SplashPage extends StatefulWidget{


  @override
  State<StatefulWidget> createState() => SplashScreenState();

}


class SplashScreenState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const RegisterWithPhoneNumber()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Image(
            image: AssetImage("/images/splash_banner.png",package: 'firstflutter'),
            width: 105,
            height: 105,
          ),
        ));
  }
}

