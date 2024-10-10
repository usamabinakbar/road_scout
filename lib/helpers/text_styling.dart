import 'package:flutter/material.dart';

import 'app_colors.dart';

class MyStyle extends AppColors {

 static var bodyText = TextStyle(
    color: AppColors.bodyColor,
    fontFamily: "Inter",
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

 static var headingText =
  TextStyle(
    fontFamily: "Inter",
    fontSize: 22,
    fontWeight: FontWeight.w700,
    color: AppColors.headingColor,
  );
 static  var onBoardingButtonStyle=TextStyle(
   fontFamily: "Inter",
   fontSize: 19,
   fontWeight: FontWeight.w600,
   color: AppColors.appPrimaryColor,
 );
 static var buttonText = TextStyle(
    fontFamily: "Inter",
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );
 static var drawerText=TextStyle(
   fontFamily: "Inter",
   fontSize: 15,
   fontWeight: FontWeight.w500,
   color:AppColors.drawerColor

 );
}
