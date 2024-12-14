import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:machine_test/views/total_vehicle.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#F6F6F6'),
      body: Column(
        children: [
          SizedBox(
            height: 25.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.menu,
                size: 30.sp,
              ),
              SizedBox(
                width: 200.w,
              ),
              Icon(
                Icons.notifications_none_outlined,
                size: 30.sp,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 60.h, left: 30.w),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(() => TotalVehiclePage());
                  },
                  child: Container(
                    width: 150.w,
                    height: 150.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/icons/car.png'),
                        ),
                        Text(
                          '100',
                          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                        ),
                        Text('Total vehicles')
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
