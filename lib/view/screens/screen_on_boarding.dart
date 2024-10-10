import 'package:flutter/material.dart';
import 'package:road_scout/controllers/controller_on_boarding.dart';
import 'package:road_scout/helpers/app_colors.dart';
import 'package:road_scout/helpers/text_styling.dart';
import 'package:road_scout/main.dart';
import 'package:road_scout/models/model_on_boarding.dart';
import 'package:get/get.dart';
import 'package:road_scout/view/screens/screen_licence_activation.dart';

import '../../helpers/button_stying.dart';

class ScreenOnBoarding extends StatelessWidget {
  ScreenOnBoarding({super.key});

  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    final ControllerOnBoarding controllerOnBoarding = Get.put(
        ControllerOnBoarding());
    return Scaffold(
      backgroundColor: AppColors.screenColor,
      body: PageView.builder(
        controller: _pageController,
        onPageChanged: (value) {
          controllerOnBoarding.currentPage.value = value;
        },
        itemCount: ModelOnBoarding.onBoardingHeading.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                height: 300,
                width: Get.width,
                child: ModelOnBoarding.onBoardingImages[index],
              ).marginOnly(top: Get.height * 0.2),
              Align(
                  alignment: Alignment.topLeft,
                  child: Text(ModelOnBoarding.onBoardingHeading[index],
                    style: MyStyle.headingText,).marginOnly(
                      top: Get.width * 0.2)),
              Text(
                ModelOnBoarding.onBoardingBody[index], style: MyStyle.bodyText.copyWith(color: AppColors.headingColor.withOpacity(0.4)),)
                  .marginOnly(bottom: Get.width * 0.05),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (index == 1 || index == 2) TextButton(
                      style: Button.onBoardingNavigatingButton,
                      onPressed: () {
                        if (index < ModelOnBoarding.onBoardingHeading.length) {
                          _pageController.previousPage(
                              duration: Duration(microseconds: 300),
                              curve: Curves.easeIn);
                        }
                      }, child: const Text("Back")),
                  Row(
                    children: List.generate(
                      ModelOnBoarding.onBoardingHeading.length,
                          (i) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 3),
                          child: Obx(() {
                            return CircleAvatar(
                              radius: 7,
                              backgroundColor: controllerOnBoarding.currentPage
                                  .value == i
                                  ? AppColors.appPrimaryColor
                                  : AppColors.inActiveCircleColor,
                            );
                          }),
                        );
                      },
                    ),
                  ),
                  if (index == 0 || index == 1) TextButton(
                      style: Button.onBoardingNavigatingButton,
                      onPressed: () {
                        if (index < ModelOnBoarding.onBoardingHeading.length -
                            1) {
                          _pageController.nextPage(
                              duration: Duration(microseconds: 300),
                              curve: Curves.easeIn);
                        }
                      }, child: Text("Next")) else
                    Text(""),
                  // Placeholder for alignment
                ],
              ).marginOnly(bottom: Get.width * 0.1),
              TextButton(
                style: Button.continueButton,
                onPressed: () {
                  index < ModelOnBoarding.onBoardingHeading.length - 1 ?
                  _pageController.nextPage(
                      duration: Duration(microseconds: 300),
                      curve: Curves.easeIn) : Get.to(ScreenLicenceActivation());
                },
                child: const Text("Get Started"),
              ),
            ],
          ).paddingSymmetric(horizontal: Get.width * 0.043);
        },
      ),
    );
  }
}
