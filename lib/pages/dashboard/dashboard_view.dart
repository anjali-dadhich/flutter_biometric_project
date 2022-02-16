import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ofa_flutter_biometric/pages/biometric/biometric_view.dart';
import 'package:ofa_flutter_biometric/pages/dashboard/dashboard_tab_controller.dart';
import 'package:ofa_flutter_biometric/pages/dashboard/fragment/myPortfolio/myPortfolio_view.dart';
import 'package:ofa_flutter_biometric/widget/custom_app_bar.dart';
import 'package:ofa_flutter_biometric/widget/custom_navigation_drawer.dart';

import 'dashboard_logic.dart';

class DashboardPage extends StatelessWidget {
  final logic = Get.put(DashboardLogic());
  final state = Get.find<DashboardLogic>().state;

  DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _dashboardTabs = Get.put(DashboardTabController());
    return Scaffold (
      drawer: const CustomNavigationDrawer(),
      appBar: CustomAppBar(
        title: "Miss Anjali Dadhich",
        height: 98,
        leadingAppBarIcon: Icons.menu,
        onPressedLeadingAppBarIcon: () {
          Scaffold.of(context).openDrawer();
        },
        tabBarBottom:  TabBar(
          tabs: _dashboardTabs.tabsList,
          controller: _dashboardTabs.tabController,
          indicatorColor: Colors.white,
          indicatorWeight: 3,
        ),
      ),
      body: TabBarView(
        controller: _dashboardTabs.tabController,
        children: [
          MyPortfolioPage(),
          MyPortfolioPage(),
        ],
      ),
    );
  }
}
