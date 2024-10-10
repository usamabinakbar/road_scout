
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:road_scout/helpers/text_styling.dart';


import 'app_colors.dart';

class Button {
 var btnBgColor;
 static var continueButton = TextButton.styleFrom(
     backgroundColor: AppColors.appPrimaryColor,
     foregroundColor: Colors.black,
     textStyle: MyStyle.buttonText,
     padding: EdgeInsets.all(15),
     fixedSize: Size.fromWidth(Get.width* 0.78)
 );
 static var onBoardingNavigatingButton = TextButton.styleFrom(
     foregroundColor: AppColors.appPrimaryColor,
     textStyle: MyStyle.onBoardingButtonStyle,
 );

 static var rejectButton = TextButton.styleFrom(
   shape: RoundedRectangleBorder(
     borderRadius: BorderRadius.circular(8),
   ),
   fixedSize: Size(90, 40),
   foregroundColor: Colors.white,
   backgroundColor: Color(0xffC7C7C7),
     );

 static var acceptButton = TextButton.styleFrom(
     shape: RoundedRectangleBorder(
         borderRadius: BorderRadius.circular(8),
         ),
       fixedSize: Size(90, 40),
       foregroundColor: Colors.white,
       backgroundColor: AppColors.appPrimaryColor,
     );

}
