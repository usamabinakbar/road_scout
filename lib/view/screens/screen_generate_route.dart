import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:road_scout/helpers/app_colors.dart';
import 'package:road_scout/helpers/text_styling.dart';
import 'package:road_scout/view/screens/screen_trip_overview.dart';
import 'package:road_scout/widgets/custom_textfield.dart';

import '../../controllers/controller_slider.dart';
import '../../helpers/button_stying.dart';
import '../../widgets/custom_slider_thumb_circle.dart';

class ScreenGenerateRoute extends StatelessWidget {
  const ScreenGenerateRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SliderController1 controller = Get.put(SliderController1());
    final SliderController2 controller2 = Get.put(SliderController2());
    final RxInt _groupValuer1 = 1.obs;
    final RxInt _groupValuer2 = 1.obs;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          leading: TextButton(onPressed: () {
            Get.back();
          }, child: Icon(Icons.arrow_back)),
          title: Text("Generate New Route", style: MyStyle.headingText.copyWith(
              fontSize: 19, fontWeight: FontWeight.w600)),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextField(
                  radius: 10,
                  hintText: "Select Location...",
                  height: 1,
                  hintColor: AppColors.headingColor,
                  suffixIcon: Icon(
                      Icons.my_location_sharp,
                      color: AppColors.appPrimaryColor),
                ).marginOnly(bottom: Get.width * 0.04),
          
                Text("Map Location", style: MyStyle.headingText.copyWith(
                    fontSize: 16, fontWeight: FontWeight.w600))
                    .marginOnly(bottom: Get.width * 0.021),
          
                Container(
                  height: Get.height * 0.2,
                  width: Get.width,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/Rectangle.png"))
                  ),
                  child: Icon(Icons.location_on, size: 60,
                      color: AppColors.appPrimaryColor),
                ).marginOnly(bottom: Get.width * 0.048),
                Text("Radius", style: MyStyle.headingText.copyWith(
                    fontSize: 16, fontWeight: FontWeight.w600, height: 1)),
                // Row for "Radius" text and slider
                Obx(() =>
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        trackHeight: 10.0,
                        overlayShape: RoundSliderOverlayShape(
                            overlayRadius: 24.0),
                        thumbShape: CustomSliderThumbCircle(
                          thumbRadius: 12,
                          thumbColor: Colors.white,
                          sliderValue: controller.sliderValue.value, unit: 'KM',
                        ),
                      ),
                      child: Slider(
                        max: 50,
                        min: 0,
                        value: controller.sliderValue.value,
                        activeColor: AppColors.appPrimaryColor,
                        onChanged: (value) {
                          controller.sliderValue.value = value;
                        },
                      ),
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("0 Km", style: MyStyle.bodyText.copyWith(
                        fontSize: 12, color: AppColors.headingColor)),
                    Text("50 Km", style: MyStyle.bodyText.copyWith(
                        fontSize: 12, color: AppColors.headingColor)),
                  ],
                ),
                Text(
                    "Start/Stop Address", style: MyStyle.headingText.copyWith(
                    fontSize: 16, fontWeight: FontWeight.w600))
                    .marginOnly(bottom: Get.width * 0.021),
          
                CustomTextField(
                  radius: 10,
                  hintText: "Select Address",
                  height: 1,
                  hintColor: AppColors.headingColor,
                  suffixIcon: Icon(
                      Icons.my_location_sharp,
                      color: AppColors.appPrimaryColor),
                ).marginOnly(bottom: Get.width * 0.02),
          
                Text(
                    "Scouting Details", style: MyStyle.headingText.copyWith(
                    fontSize: 16, fontWeight: FontWeight.w600)),
          
                Obx(() {
                  return Row(
                      children: [
                        Row(
                          children: [
                            Radio(
                              fillColor: WidgetStatePropertyAll(AppColors
                                  .appPrimaryColor),
                              value: 1,
                              groupValue: _groupValuer1.value,
                              onChanged: (value) {
                                _groupValuer1.value = value!;
                              },
                            ),
                            Text("Basic", style: TextStyle(
                                fontFamily: "Inter",
                                fontSize: 15,
                                fontWeight: FontWeight.w500),),
                          ],
                        ).paddingOnly(right: Get.width * 0.05),
          
                        Row(
                          children: [
                            Radio(
                              fillColor: WidgetStatePropertyAll(
                                  AppColors.appPrimaryColor),
                              value: 2,
                              groupValue: _groupValuer1.value,
                              onChanged: (value) {
                                _groupValuer1.value = value!;
                              },
                            ),
                            Text("Thorough", style: TextStyle(
                                fontFamily: "Inter",
                                fontSize: 15,
                                fontWeight: FontWeight.w500)),
                          ],
                        ),
                      ]
                  );
                }),
          
                Text(
                    "Method of Scouting", style: MyStyle.headingText.copyWith(
                    fontSize: 16, fontWeight: FontWeight.w600)),
                Obx(() {
                  return Row(
                    children: [
                      Row(
                        children: [
                          Radio(
                            fillColor: MaterialStateProperty.all(AppColors
                                .appPrimaryColor),
                            value: 1,
                            groupValue: _groupValuer2.value,
                            onChanged: (value) {
                              _groupValuer2.value = value!;
                            },
                          ),
                          Text(
                            "Car",
                            style: TextStyle(
                              fontFamily: "Inter",
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ).paddingOnly(right: Get.width * 0.08),
          
                      Row(
                        children: [
                          Radio(
                            fillColor: MaterialStateProperty.all(
                                AppColors.appPrimaryColor),
                            value: 2,
                            groupValue: _groupValuer2.value,
                            onChanged: (value) {
                              _groupValuer2.value = value!;
                            },
                          ),
                          Text(
                            "Bike",
                            style: TextStyle(
                              fontFamily: "Inter",
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 20), // Space between radio buttons
                      Row(
                        children: [
                          Radio(
                            fillColor: MaterialStateProperty.all(
                                AppColors.appPrimaryColor),
                            value: 3,
                            groupValue: _groupValuer2.value,
                            onChanged: (value) {
                              _groupValuer2.value = value!;
                            },
                          ),
                          Text(
                            "Walk",
                            style: TextStyle(
                              fontFamily: "Inter",
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                }),
                Text(
                    "Method of Scouting", style: MyStyle.headingText.copyWith(
                    fontSize: 16, fontWeight: FontWeight.w600)),
                Obx(() =>
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        trackHeight: 10.0,
                        overlayShape: RoundSliderOverlayShape(
                            overlayRadius: 24.0),
                        thumbShape: CustomSliderThumbCircle(
                          thumbRadius: 12,
                          thumbColor: Colors.white,
                          sliderValue: controller2.sliderValue.value, unit: 'hr',
                        ),
                      ),
                      child: Slider(
                        max: 8,
                        min: 0,
                        value: controller2.sliderValue.value,
                        activeColor: AppColors.appPrimaryColor,
                        onChanged: (value) {
                          controller2.sliderValue.value = value;
                        },
                      ),
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("0 Minutes", style: MyStyle.bodyText.copyWith(
                        fontSize: 12, color: AppColors.headingColor)),
                    Text("8 Hours", style: MyStyle.bodyText.copyWith(
                        fontSize: 12, color: AppColors.headingColor)),
                  ],
                ),
                Center(
                  child: TextButton(
                      style: Button.continueButton,
                      onPressed: () {
                        showModalBottomSheet(context: context, builder: (context) {
                          return SizedBox(
                            height: Get.width*0.85,
                            child: Column(
                              children: [

                                SvgPicture.asset("assets/images/Danger.svg")
                                    .marginOnly(top: Get.width * 0.05,
                                    bottom: Get.width * 0.026),

                                Center(child: Text("Session Length Too Short!",
                                  style: MyStyle.headingText.copyWith(
                                      fontSize: 20, fontWeight: FontWeight.w600,color: AppColors.appPrimaryColor),))
                                    .marginOnly(bottom: Get.width * 0.013),
                                Text(
                                  "The session length is not sufficient to cover all roads within the selected radius. Please increase the session duration and try again.",
                                  textAlign: TextAlign.center,
                                  style: MyStyle.bodyText.copyWith(
                                      fontSize: 15, color: Color(0xff333333)),)
                                    .marginOnly(bottom: Get.width * 0.06),
                                TextButton(
                                    style: Button.continueButton,
                                    onPressed: () {
                                      Get.to(ScreenTripOverview());


                                    }, child: Text("Done"))

                              ],
                            ).marginSymmetric(horizontal: Get.width*0.1),
                          );
                        },);

                  }, child: Text("Generate Routes")).marginSymmetric(vertical: Get.width*0.03),
                )
              ]
          ).marginSymmetric(horizontal: Get.width * 0.04),
        ),
    );
  }
}
