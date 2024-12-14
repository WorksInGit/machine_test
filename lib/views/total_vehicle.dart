import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class TotalVehiclePage extends StatelessWidget {
  const TotalVehiclePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#F6F6F6'),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: HexColor('#F6F6F6'),
        title: Text(
          'Total Vehicle',
          style:
              GoogleFonts.poppins(fontSize: 18.sp, fontWeight: FontWeight.w600),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                prefixIcon: Icon(Icons.search, color: Colors.grey,),
                hintText: 'Search...',
                hintStyle: TextStyle(color: Colors.grey), // Hint text color
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: BorderSide.none
                ) // No border
              ),
              style: TextStyle(color: Colors.white), // Text color
            ),
          ),
          Expanded(child: ListView.builder(itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Card(
                color: Colors.white,
                child: Column(
                  children: [
                 Container(
                  width: 400.w,
                  height: 170.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: Colors.green
                  ),
                 ),
                 Row(
                   children: [
                     Text('car'),
                   
                   ],
                 ),
                   Row(
                     children: [
                       Text('1000'),
                     ],
                   ),
                   Divider(
                    color: Colors.grey,
                   ),
                   Row(
                    children: [
                      
                    ],
                   )
                  ],
                ),
              ),
            );
          },))
        ],
      ),
    );
  }
}
