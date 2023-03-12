import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:inventory_app/app/widgets/CathegoryItemWeb.dart';
import 'package:sizer/sizer.dart';

import '../../../core/utils/AppLayout.dart';
import '../../../core/utils/Styles.dart';
import '../../widgets/CathegoryItem.dart';
import '../../widgets/cathegory_divider.dart';
import 'dashboard_controller.dart';

class DashboardScreenWeb extends StatelessWidget {
   DashboardScreenWeb({Key? key}) : super(key: key);
  DashboardController dashboardController = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white70,
        body:
        Container(
          width: screenSize.width ,
          height:  screenSize.height ,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Colors.white,
                  Colors.greenAccent,
                ],
                begin: FractionalOffset.bottomCenter,
                end: FractionalOffset.topCenter,
                tileMode: TileMode.mirror),
          ),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              Container(
                width: screenSize.width-100,
                color: Colors.transparent,
                child: Column(
                  children: [
                    SizedBox(
                      height: 1.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: AppLayout.getHeight(5),
                          right: AppLayout.getHeight(5)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Inventory Manager web",
                                style: headingweb5,
                              ),
                              SizedBox(
                                height: AppLayout.getHeight(10),
                              ),
                            ],
                          ),
                          Container(
                            width: 70,
                            height: 70,
                            margin: EdgeInsets.only(
                                right: AppLayout.getHeight(10)),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: const DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        "assets/images/splash_image.png"))),
                          )
                        ],
                      ),
                    ),

                    SizedBox(
                      height: 1.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 1.h,
                          right: 1.h),
                      child: const CategoryDivider(
                        title: 'Current Stock :',
                      ),
                    ),
                    SizedBox(
                      height: AppLayout.getHeight(10),
                    ),
                    Container(
                        height: 8.h,
                        width: 100.w,
                        margin: EdgeInsets.all(1.h),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Container(
                            //     padding:EdgeInsets.all(2.h),
                            //     child: Text("Category" ,style: TextStyle(color: Colors.grey,fontSize: 13.sp,fontWeight: FontWeight.w400),)),
                          ],
                        )
                    ),

                    SizedBox(
                      height: AppLayout.getHeight(20),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: AppLayout.getHeight(10),
                          right: AppLayout.getHeight(10)),
                      child: const CategoryDivider(
                        title: 'Top Categories :',
                      ),
                    ),
                    SizedBox(
                      height: AppLayout.getHeight(10),
                    ),
                    Container(
                        height: screenSize.height -100,
                        width: screenSize.width -100,
                        child: GetBuilder<DashboardController>(
                          builder: (context) {
                            // return  ListView.builder(
                            //     scrollDirection: Axis.vertical,
                            //     physics:
                            //     const BouncingScrollPhysics(),
                            //     itemCount:
                            //     context.localDbCategory.length,
                            //     itemBuilder: (context, index) {
                            //       return Row(children: [
                            //         CathegoryItem(
                            //           category: dashboardController.localDbCategory[index],
                            //         )
                            //       ]);
                            //     });
                            return GridView.builder(
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                    // maxCrossAxisExtent: 200,
                                    // childAspectRatio: 3 / 2,
                                    // crossAxisSpacing: 20,
                                    // mainAxisSpacing: 20
                                  crossAxisCount: 4,
                                  crossAxisSpacing: 6,
                                  mainAxisSpacing: 2
                                ),
                                itemCount:  context.localDbCategory.length,
                                itemBuilder: (context,index){
                                        return Row(children: [
                                          CathegoryItemWeb(
                                            category: dashboardController.localDbCategory[index],
                                         )
                                       ]);
                                }
                            );
                          },
                        )

                    ),


                    SizedBox(
                      height: AppLayout.getHeight(10),
                    ),

                  ],
                ),
              ),
            ],
          ),
        )

    );
  }
}
