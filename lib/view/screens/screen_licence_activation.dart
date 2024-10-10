import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:road_scout/helpers/app_colors.dart';
import 'package:road_scout/helpers/button_stying.dart';
import 'package:road_scout/helpers/text_styling.dart';
import 'package:road_scout/view/screens/screen_route_listings.dart';
import 'package:road_scout/widgets/custom_textfield.dart';
import 'package:get/get.dart';

class ScreenLicenceActivation extends StatelessWidget {
  const ScreenLicenceActivation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screenColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(child: Image.asset("assets/images/logo_trans.png",width: Get.width*0.58,)).marginOnly(top: Get.width*0.44,bottom: Get.width*0.1),
            Text("Enter license Key!",style: MyStyle.headingText.copyWith(fontSize: 18)).marginOnly(bottom: Get.width*0.026),
            Text("Enter your 10-digit license key and click “Activate.” If valid, you'll gain access.",textAlign: TextAlign.center,style: MyStyle.bodyText.copyWith(fontSize: 14),).marginOnly(bottom: Get.width*0.1),
            CustomTextField(radius: 10,hintText: "Enter License Key",hintColor: AppColors.hintColor,).marginOnly(bottom: Get.width*0.14),
            TextButton(
                style: Button.continueButton,

                onPressed: () {
                  showDialog(context: context, builder: (context) {
                    return AlertDialog(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                      ),
                      title: SvgPicture.asset("assets/images/check.svg")
                          .marginOnly(top: Get.width * 0.09,
                          bottom: Get.width * 0.04),
                      actions: [
                        Center(child: Text("You’re Verified",
                          style: MyStyle.headingText.copyWith(
                              fontSize: 18, fontWeight: FontWeight.w600),))
                            .marginOnly(bottom: Get.width * 0.013),
                        Text(
                          "Your license key has been successfully verified. You're all set to continue using the app",
                          textAlign: TextAlign.center,
                          style: MyStyle.bodyText.copyWith(
                              fontSize: 15, color: Color(0xff838BA1)),)
                            .marginOnly(bottom: Get.width * 0.048),
                        TextButton(
                            style: Button.continueButton,
                            onPressed: () {
                              Get.to(ScreenRouteListings());

                            }, child: Text("Continue"))

                      ],
                    );
                      }
                  );
                  // set according to condition after fetching data from database.
                    showModalBottomSheet(context: context, builder: (context) {
                      return SizedBox(
                        height: Get.width*0.85,
                        child: Column(
                          children: [

                              SvgPicture.asset("assets/images/Danger.svg")
                                  .marginOnly(top: Get.width * 0.05,
                                  bottom: Get.width * 0.026),

                                Center(child: Text("Invalid License Key!",
                                  style: MyStyle.headingText.copyWith(
                                      fontSize: 20, fontWeight: FontWeight.w600,color: AppColors.appPrimaryColor),))
                                    .marginOnly(bottom: Get.width * 0.013),
                                Text(
                                  "The license key you entered is invalid. Please check for any errors or missing characters and try again.",
                                  textAlign: TextAlign.center,
                                  style: MyStyle.bodyText.copyWith(
                                      fontSize: 15, color: Color(0xff333333)),)
                                    .marginOnly(bottom: Get.width * 0.06),
                                TextButton(
                                    style: Button.continueButton,
                                    onPressed: () {

                                    }, child: Text("Try Again"))

                              ],
                            ).marginSymmetric(horizontal: Get.width*0.1),
                      );
                    },);
            }, child: Text("Activate"))
          ],
        ).paddingSymmetric(horizontal: Get.width*0.04),
      ),
    );

  }
}
