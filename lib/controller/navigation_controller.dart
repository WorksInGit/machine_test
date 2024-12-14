import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machine_test/views/home_page.dart';
import 'package:machine_test/views/requirement_list.dart';

class NavigationController extends GetxController {
  var pages = <Widget>[
    const HomePage(),
    const Center(child: Text('Messages Page', style: TextStyle(fontSize: 20))),
    const Center(child: Text('', style: TextStyle(fontSize: 20))),
    const RequirementList(),
    const Center(child: Text('Profile Page', style: TextStyle(fontSize: 20))),
  ].obs;

  var currentIndex = 0.obs;

  void changePage(int index) {
    currentIndex.value = index;
  }
}
