import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mp_chart/mp/chart/pie_chart.dart';
import 'package:mp_chart/mp/core/animator.dart';
import 'package:ofa_flutter_biometric/utils/constants/color_contant.dart';

import 'myPortfolio_logic.dart';

class MyPortfolioPage extends StatelessWidget {
  final logic = Get.put(MyPortfolioLogic());
  final state = Get.find<MyPortfolioLogic>().state;

  MyPortfolioPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
          children: [
            Container(
              //height: 100,
              color: primaryColor,
              alignment: Alignment.center,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  buildColumn(columnText1: "31750000", columnText2: "CURRENT VALUE"),
                  buildColumn(columnText1: "10050000", columnText2: "INVESTED" ),
                  buildColumn(columnText1: "11030010", columnText2: "ANNUALISED (46.12%) RETURNS" ),
                ],
              ),
            ),
            _initPieChart(),
          ],
        ),
      );
  }

  Widget buildColumn({
    required String columnText1,
    required String columnText2,
    //required Color color,
  }){
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                columnText1,
                textAlign: TextAlign.start,
                style: const TextStyle(fontSize: 13, color: Colors.white),
              ),
              Text(
                columnText2,
                style: const TextStyle(fontSize: 10, color: Colors.white70),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _initPieChart() {
    var pieChart = PieChart(state.controller);
    state.controller.animator
      ..reset()
      ..animateY2(1400, Easing.EaseInOutQuad);
    return pieChart;
  }
}
