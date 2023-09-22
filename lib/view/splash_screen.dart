import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thekedar/view_models/services/splash_services.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  SplashServices splashScreen = SplashServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashScreen.isLogin();

  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:Container(
          decoration:const BoxDecoration(
            image:  DecorationImage(
              image: AssetImage("assets/logo/logo.png"),
              fit: BoxFit.fitWidth,
            ),
          )
      ),
    );
  }
}
