import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:road_scout/helpers/app_colors.dart';

import '../../helpers/text_styling.dart';

class ScreenSoundSettings extends StatelessWidget {
  ScreenSoundSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var selectedValue = 0.obs;
    var title = [
      "English (US)-Sarah",
      "English (US)-Ben",
      "English (US)-Ben",
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        leading: TextButton(onPressed: () {
          Get.back();
        }, child: Icon(Icons.arrow_back)),
        title: Text("Sound Settings", style: MyStyle.headingText.copyWith(
            fontSize: 19, fontWeight: FontWeight.w600)),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Image.asset("assets/images/sound_on.png", height: 80,),
                  Text("Sound On", style: TextStyle(fontFamily: "Inter",
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff7B7B7B)),),
                ],
              ),
              Column(
                children: [
                  Image.asset("assets/images/alerts_only.png", height: 80,),
                  Text("Alerts Only", style: TextStyle(fontFamily: "Inter",
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff7B7B7B))),
                ],
              ),
              Column(
                children: [
                  Image.asset("assets/images/mute.png", height: 80,),
                  Text("Sound Off", style: TextStyle(fontFamily: "Inter",
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff7B7B7B))),
                ],
              ),

            ],
          ),
          Divider(thickness: 10),
          Text("Voice Directions",
            style: MyStyle.headingText.copyWith(fontSize: 19),),
          Expanded(
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Image.asset("assets/images/mic.png", height: 35,),
                  title: Text(title[index], style: MyStyle.headingText.copyWith(
                      fontSize: 15, fontWeight: FontWeight.w600),),
                  subtitle: Text("Including Street names",
                    style: MyStyle.bodyText.copyWith(
                        fontSize: 14, color: Color(0xff9A9A9A)),),
                  trailing: Obx(() {
                    return Radio(
                      fillColor: WidgetStatePropertyAll(
                          AppColors.appPrimaryColor),
                      value: index,
                      groupValue: selectedValue.value,
                      onChanged: (value) {
                        selectedValue.value = value!;
                      },);
                  }),
                );
              },),
          )
        ],
      ).paddingSymmetric(horizontal: 10),
    );
  }
}

