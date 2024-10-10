import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_common/get_reset.dart';
import 'package:road_scout/helpers/app_colors.dart';
import 'package:road_scout/helpers/text_styling.dart';

class ScreenAustinTexas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screenColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        centerTitle: true,
        title: Text("Austin, Texas Routes",style: MyStyle.headingText.copyWith(fontSize: 19,fontWeight: FontWeight.w600),),
      ),
      body:ListView.builder(
        padding: EdgeInsets.all(18),
        itemBuilder: (context, index) {
        
        return Container(
          height: 80.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    spreadRadius: 0,
                    blurRadius: 20,
                  ),]),
          child: ListTile(
            title: Text("Trip 01",style: MyStyle.headingText.copyWith(fontSize: 14,fontWeight: FontWeight.w500),),
            subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset("assets/icons/hum_burger.svg",height: 24,),
                      Text("Thorough"),
                      SvgPicture.asset("assets/icons/walk.svg",height: 24,),
                      Text("Walk"),
                      SvgPicture.asset("assets/icons/distance.svg",height: 24,),
                      Text("14 km"),
                    ],
                  ),
            trailing:(index==0||index==1||index==2)?Icon(Icons.check_circle, color: Color(0xff5DD134),size: 30,):Icon(Icons.play_circle_fill, color: AppColors.appPrimaryColor,size: 30,),
          )
        ).marginOnly(bottom: Get.width*0.032);
      },),

    );
  }
}

