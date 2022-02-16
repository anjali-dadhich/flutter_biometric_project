import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:ofa_flutter_biometric/pages/biometric/biometric_view.dart';
import 'package:ofa_flutter_biometric/pages/dashboard/dashboard_view.dart';
import 'package:ofa_flutter_biometric/pages/dashboard/fragment/myPortfolio/myPortfolio_view.dart';
import 'package:ofa_flutter_biometric/utils/constants/color_contant.dart';

void main(){
  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: primaryColor,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Biometric',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      debugShowCheckedModeBanner: false,
      home: DashboardPage(),
    );
  }
}

