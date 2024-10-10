import 'package:flutter/material.dart';
import 'package:road_scout/helpers/text_styling.dart';

import 'app_colors.dart';

class TextFieldStyling
{
  static var texFieldDecoration=InputDecoration(
    hintStyle:MyStyle.bodyText ,
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: AppColors.appPrimaryColor),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: AppColors.hintColor),
    ),
  );
}