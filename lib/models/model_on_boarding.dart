import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ModelOnBoarding
{
  static var onBoardingImages=[
    SvgPicture.asset("assets/icons/Smart-mobility-amico.svg",),
    SvgPicture.asset("assets/icons/GPS-navigator-rafiki.svg"),
    SvgPicture.asset("assets/icons/Progress-overview-amico.svg"),
  ];
  static var onBoardingHeading=[
    "Welcome to RoadScout",
    "Plan Your Journey",
    "Track Your Progress"
  ];
  static var onBoardingBody=[
    "Discover every road in your city with seamless offline navigation.",
    "Set your Preferences, and generate optimized routes.",
    "Monitor your covered roads and keep exploring with turn-by-turn guidance."
  ];
}