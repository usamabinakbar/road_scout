import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:road_scout/controllers/controller_expension-tile.dart';
import 'package:road_scout/helpers/button_stying.dart';
import '../../helpers/app_colors.dart';
import '../../helpers/text_styling.dart';

class ScreenOnTheWay extends StatelessWidget {
  ScreenOnTheWay({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    final ControllerExpansion expansionController = Get.put(
        ControllerExpansion());
    return Scaffold(
        backgroundColor: AppColors.screenColor,
        appBar: AppBar(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          centerTitle: true,
          leadingWidth: Get.width,
          toolbarHeight: 80,
          leading: ListTile(
            leading: SvgPicture.asset(
              "assets/icons/turn_sharp_righ.svg", height: 50,),
            title: Text("970 m", style: MyStyle.headingText.copyWith(
                fontSize: 20, fontWeight: FontWeight.w600),),
            subtitle: Text("Brooklyn Bridge, New York",
              style: MyStyle.headingText.copyWith(fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: AppColors.appPrimaryColor),),
          ),

        ),
        body: Column(
          children: [
            Image.asset("assets/images/img1.png", fit: BoxFit.cover,)
          ],
        ),
        bottomSheet: Obx(() {
          return ExpansionTile(
            backgroundColor: Colors.white,
            collapsedBackgroundColor: Colors.white,
            onExpansionChanged: (bool expanding) {
              expansionController.isOpen.value = expanding;
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20), topLeft: Radius.circular(20)),
            ),
            collapsedShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20), topLeft: Radius.circular(20)),
            ),
            title: Text(
              "44 minutes", style: MyStyle.headingText.copyWith(fontSize: 20),),
            subtitle: Wrap(
              children: [
                SvgPicture.asset("assets/icons/hum_burger.svg", height: 24,),
                Text("Thorough").paddingSymmetric(horizontal: 10),
                SvgPicture.asset("assets/icons/walk.svg", height: 24,),
                Text("Walk").paddingSymmetric(horizontal: 10),
                SvgPicture.asset("assets/icons/distance.svg", height: 24,),
                Text("20 km").paddingSymmetric(horizontal: 10),
              ],
            ),
            trailing: expansionController.isOpen.value ? Icon(
                Icons.arrow_drop_up_sharp) : Icon(Icons.arrow_drop_down_circle),
            children: [
              TextButton(
                  style: Button.continueButton.copyWith(foregroundColor: WidgetStatePropertyAll(Colors.white),backgroundColor: WidgetStatePropertyAll(Color(0xffFB3939))),
                  onPressed: () {
                    showDialog(context: context, builder: (context) {
                      return AlertDialog(
                        actionsPadding: EdgeInsets.all(10),
                        backgroundColor: Colors.white,
                        surfaceTintColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        actions:  [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text("Cancel Scouting?",style: MyStyle.headingText.copyWith(fontSize: 20,fontWeight: FontWeight.w600,color: Color(0xffEB141B)
                            ),),
                          ),
                          Text("Are you sure you want to cancel scouting? This action cannot be undone.",style: MyStyle.headingText.copyWith(fontSize: 16,fontWeight: FontWeight.w500)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                  style: Button.rejectButton,
                                  onPressed: () {

                                  }, child: Text("Cancel")).paddingOnly(right: Get.width*0.03),
                              TextButton(
                                  style:Button.acceptButton,
                                  onPressed: () {

                                  }, child:Text("Yes")),
                            ],
                          ),
                        ],

                      );
                    },);

              }, child: Text("Cancel Scouting"))
            ],
          );
        })

    );
  }
}

