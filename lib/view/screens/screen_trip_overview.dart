import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_common/get_reset.dart';
import 'package:road_scout/helpers/app_colors.dart';
import 'package:road_scout/helpers/button_stying.dart';
import 'package:road_scout/view/screens/screen_on_the_way.dart';

import '../../helpers/text_styling.dart';

class ScreenTripOverview extends StatelessWidget {
  const ScreenTripOverview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screenColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        centerTitle: true,
        title: Text("Trip Overview",style: MyStyle.headingText.copyWith(fontSize: 19,fontWeight: FontWeight.w600),),
      ),
      body: Column(
        children: [
          Image.asset("assets/images/img.png",fit: BoxFit.cover,)
        ],
      ),
      bottomSheet:Container(
        height: 192,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ListTile(
            title: Text("44 minutes",style: MyStyle.headingText.copyWith(fontSize: 20),),
            subtitle: Wrap(
              children: [
                SvgPicture.asset("assets/icons/hum_burger.svg",height: 24,),
                Text("Thorough").paddingSymmetric(horizontal: 10),
                SvgPicture.asset("assets/icons/walk.svg",height: 24,),
                Text("Walk").paddingSymmetric(horizontal: 10),
                SvgPicture.asset("assets/icons/distance.svg",height: 24,),
                Text("20 km").paddingSymmetric(horizontal: 10),
              ],
            ),
            ),
            Divider(),
            TextButton(
                style: Button.continueButton,
                onPressed: () {
                  Get.to(ScreenOnTheWay());
            }, child: Text("Start Scouting"))
          ],
        ),
      ) ,
    );
  }
}
