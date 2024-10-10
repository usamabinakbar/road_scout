import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:road_scout/view/screens/screen_sound_settings.dart';

import '../helpers/app_colors.dart';
import '../helpers/text_styling.dart';

class CustomDrawer extends StatelessWidget {
   CustomDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            height: Get.width*0.57,
            width: Get.width,
            color:AppColors.appPrimaryColor,
            child: Column(
              children: [
                Text(
                  "User ID",
                  style:MyStyle.bodyText.copyWith(fontSize: 14,fontWeight: FontWeight.w600,color: Color(0xff263238))
                ).marginOnly(top: Get.width*0.32, left: Get.width*0.058,bottom: Get.width*0.021),
                Text(
                    "#271324",
                    style:MyStyle.bodyText.copyWith(fontWeight: FontWeight.w600,color: Color(0xff263238))
                ).marginOnly( left: Get.width*0.058,bottom: Get.width*0.1)
              ],
            )
          ),

          ListTile(
            leading: SvgPicture.asset("assets/icons/home.svg"),
            title: Text(
              "Home",
              style: MyStyle.drawerText
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.to(ScreenSoundSettings());
            },
            child: ListTile(
              leading: SvgPicture.asset("assets/icons/sound_setting.svg"),
              title: Text(
                "Sound Settings",
                style: MyStyle.drawerText            ),
            ),
          ),
          ListTile(
            leading: SvgPicture.asset("assets/icons/mode_setting.svg"),
            title: Text(
              "Mode Settings",
              style: MyStyle.drawerText,
            ),
          ),
        ],
      ),
    );}
  }
