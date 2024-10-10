import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:road_scout/view/screens/screen_on_boarding.dart';

void main()
{
  runApp(RoadScout());
}
class RoadScout extends StatelessWidget {
  const RoadScout({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder:(context, child) =>  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: ScreenOnBoarding(),
    ),
    );
    //
  }
}
