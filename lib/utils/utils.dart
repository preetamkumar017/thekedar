import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:thekedar/res/colors/app_color.dart';
class Utils {


    static void fieldFocusChange(BuildContext context , FocusNode current , FocusNode  nextFocus ){
      current.unfocus();
      FocusScope.of(context).requestFocus(nextFocus);
    }

    static toastMessage(String message){
      Fluttertoast.showToast(
          msg: message ,
        backgroundColor: AppColor.blackColor ,
        textColor: AppColor.whiteColor,
        gravity: ToastGravity.BOTTOM,
        toastLength: Toast.LENGTH_LONG,


      );
    }


    static toastMessageCenter(String message){
      Fluttertoast.showToast(
        msg: message ,
        backgroundColor: AppColor.blackColor ,
        gravity: ToastGravity.CENTER,
        toastLength: Toast.LENGTH_LONG,
        textColor: AppColor.whiteColor,
      );
    }

    static snackBar(String title, String message){
      Get.snackbar(
          title,
          message ,
        backgroundColor:const Color(0xFFFD0454),
        colorText: Colors.white,

        icon: const Icon(Icons.error_outline,color: Colors.white,),
        snackStyle: SnackStyle.FLOATING
      );
    }

    static void flushBarErrorMessage(String message, BuildContext context){

      showFlushbar(context: context,
        flushbar: Flushbar(
          forwardAnimationCurve:Curves.decelerate,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          padding: const EdgeInsets.all(15),
          message: message,
          duration: const Duration(seconds: 3),
          borderRadius: BorderRadius.circular(8),
          flushbarPosition: FlushbarPosition.TOP,
          backgroundColor: Colors.red,
          reverseAnimationCurve: Curves.easeInOut,
          positionOffset: 20,
          icon: const Icon(Icons.error , size: 28 , color: Colors.white,),
        )..show(context),

      );

    }
}