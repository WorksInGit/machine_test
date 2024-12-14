import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:iconsax/iconsax.dart';
import 'package:machine_test/controller/navigation_controller.dart';

class BottomNav extends StatelessWidget {
  BottomNav({super.key});

  final NavigationController navController = Get.put(NavigationController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(() {
          return navController.pages[navController.currentIndex.value];
        }),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.r)),
              backgroundColor: HexColor('#4A101D'),
              onPressed: () {
                Get.to(() => const SellPage());
              },
              child: const Icon(Iconsax.dollar_circle,
                  color: Colors.white, size: 30),
            ),
            const SizedBox(height: 8),
            Text(
              'Sell',
              style: TextStyle(
                fontSize: 13.sp,
                color: HexColor('#4A101D'),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 15.h,
            )
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            currentIndex: navController.currentIndex.value,
            onTap: (index) {
              navController.changePage(index);
            },
            selectedLabelStyle: GoogleFonts.poppins(fontSize: 12.sp),
            unselectedLabelStyle: GoogleFonts.poppins(fontSize: 12.sp),
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.grey,
            showUnselectedLabels: true,
            items: [
              const BottomNavigationBarItem(
                icon: Icon(Iconsax.home5),
                label: 'Home',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Iconsax.message5),
                label: 'Messages',
              ),
              const BottomNavigationBarItem(
                icon: SizedBox(width: 24),
                label: '',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Iconsax.document5),
                label: 'Requirements',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.person_3),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SellPage extends StatelessWidget {
  const SellPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sell Page")),
      body: const Center(
        child: Text("This is the Sell Page", style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
