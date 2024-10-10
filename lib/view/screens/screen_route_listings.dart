import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:road_scout/helpers/app_colors.dart';
import 'package:road_scout/helpers/button_stying.dart';
import 'package:road_scout/helpers/text_styling.dart';
import 'package:road_scout/models/model_route_listings.dart';
import 'package:road_scout/view/screens/screen_austin_texas.dart';
import 'package:road_scout/view/screens/screen_generate_route.dart';
import 'package:road_scout/widgets/custom_drawer.dart';
import 'package:get/get.dart';
class ScreenRouteListings extends StatelessWidget {
  const ScreenRouteListings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screenColor,
      drawer: CustomDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        leading: Builder(
          builder: (context) {
            return IconButton(onPressed: () {
              Scaffold.of(context).openDrawer();
            }, icon: SvgPicture.asset("assets/icons/menu_icon.svg"));
          }
        ),
        title: Image.asset("assets/images/logo_trans.png",width: Get.width*0.5,),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
              Get.to(ScreenAustinTexas());
              },
              child: ListView.builder(

                itemCount: ModelRouteListings.listHeading.length,
                itemBuilder: (context, index) {
                      return Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 20,
                        spreadRadius: 0,
                        color: AppColors.headingColor.withOpacity(0.15)
                      ),

                    ]
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(ModelRouteListings.listHeading[index],style: MyStyle.headingText.copyWith(fontSize: 14,fontWeight: FontWeight.w600),).marginOnly(bottom: Get.width*0.013),
                        Row(
                          children: [
                            SvgPicture.asset("assets/icons/hum_burger.svg").paddingOnly(right: 3),
                            Text("Thorough"),
                            SvgPicture.asset("assets/icons/walk.svg").paddingOnly(left:15,right: 3),
                            Text("Walk"),
                            SvgPicture.asset("assets/icons/distance.svg").paddingOnly(left:15,right: 3),
                            Text("100km"),
                          ],
                        ),
                        Align(
                          heightFactor: 0.4,
                          alignment: Alignment.topRight,
                          child: PopupMenuButton<int>(
                            color: Colors.white,
                            position: PopupMenuPosition.under,

                            child: Icon(Icons.more_horiz_rounded,size: 26,),
                            //onSelected: (item) => onSelected(context, item),
                            itemBuilder: (context) => [
                              PopupMenuItem<int>(
                                value: 0,
                                child: TextButton(onPressed: () {

                                },child: Text('Scout Again',style: TextStyle(fontFamily:"Inter",fontWeight:FontWeight.w600,fontSize:11,color: Color(0xff272727)),)),
                              ),
                              PopupMenuItem<int>(
                                value: 1,
                                child: TextButton(
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
                                          child: Text("Delete?",style: MyStyle.headingText.copyWith(fontSize: 20,fontWeight: FontWeight.w600,color: Color(0xffEB141B)
                                          ),),
                                        ),
                                        Text("Are you sure you want to delete this  from your scouting history?"),
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
                        },child: Text('Delete History',style: TextStyle(fontFamily:"Inter",fontWeight:FontWeight.w600,fontSize:11,color: Color(0xff272727)))),
                              ),
                            ],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 4,
                          ),
                        ),


                        Row(
                          children: [
                                SizedBox(
                                  width: 101,
                                  child: LinearProgressIndicator(
                                    value: 0.5,
                                    backgroundColor: Color(0xffE4E4E4),
                                    valueColor:AlwaysStoppedAnimation<Color>(AppColors.appPrimaryColor),
                                    minHeight: 6,
                                  ),
                                ),
                            Text("55%",style: MyStyle.bodyText.copyWith(fontSize: 8, fontWeight: FontWeight.w500,color: Color(0xff484848)),).paddingSymmetric(horizontal: Get.width*0.01),
                                CircleAvatar(radius: 4,backgroundColor: Color(0xff455A6499).withOpacity(0.6),),
                               index!=3?Text("In Progress",style: MyStyle.bodyText.copyWith(fontSize: 8, fontWeight: FontWeight.w500,color: Color(0xff489DEB)),).paddingSymmetric(horizontal: Get.width*0.01):
                               Text("Completed",style: MyStyle.bodyText.copyWith(fontSize: 8, fontWeight: FontWeight.w500,color: Color(0xff3CBC39)),).paddingSymmetric(horizontal: Get.width*0.01)],
                        ).marginOnly(bottom: Get.width*0.02),
                        Row(

                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SvgPicture.asset("assets/icons/calender.svg").paddingOnly(right: 3),
                            Text("26 Sep, 2024",style: MyStyle.bodyText.copyWith(fontSize: 8, fontWeight: FontWeight.w500,color: Color(0xff484848)),).paddingSymmetric(horizontal: Get.width*0.01),
                          ],
                        ),

                      ],
                    ),
                ).marginOnly(left: Get.width*0.048,right:  Get.width*0.048,top:  Get.width*0.032);
              },),
            ),
          ),
          Text("2024.10.12.15:36:11",style: TextStyle(fontFamily: "Inter",fontSize: 15,fontWeight: FontWeight.w600,color: AppColors.appPrimaryColor),),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.appPrimaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(60)
        ),
        onPressed: () {
        Get.to(ScreenGenerateRoute());
      },
      child: Icon(Icons.add,color: Colors.black,size: 30,),
      ),
    );
  }
}
