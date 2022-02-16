import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardTabController extends GetxController with SingleGetTickerProviderMixin {
  late TabController tabController;

  final List<Tab> tabsList = <Tab> [
    const Tab(
      text: "MY PORTFOLIO",
    ),
    const Tab(
      text: "Tab2",
    )
  ];

  @override
  void onInit() {
    tabController = TabController(length: 2, vsync: this);
    super.onInit();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}