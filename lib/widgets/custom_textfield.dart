
import 'package:flutter/material.dart';

import '../helpers/app_colors.dart';
import '../helpers/text_styling.dart';

class CustomTextField extends StatelessWidget {
  final Widget? suffixIcon;
  final double? radius;
  final String? hintText;
  final int? height;
  final action;
  final hintColor;
  final FieldController;


  CustomTextField({
    this.suffixIcon,
    this.radius,
    this.hintText,
    this.height,
    this.action,
    this.hintColor,
    this.FieldController,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: FieldController,
      onTap: action,
      maxLines: height,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle:MyStyle.bodyText.copyWith(color: hintColor) ,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius!),
          borderSide: BorderSide(color: AppColors.appPrimaryColor),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius!),
          borderSide: BorderSide(color: AppColors.hintColor),
        ),
      ),
    );
  }
}
