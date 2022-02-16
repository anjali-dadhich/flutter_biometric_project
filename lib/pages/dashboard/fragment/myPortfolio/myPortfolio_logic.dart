import 'dart:math';
import 'dart:ui';

import 'package:get/get.dart';
import 'package:mp_chart/mp/controller/pie_chart_controller.dart';
import 'package:mp_chart/mp/core/common_interfaces.dart';
import 'package:mp_chart/mp/core/data/pie_data.dart';
import 'package:mp_chart/mp/core/data_set/pie_data_set.dart';
import 'package:mp_chart/mp/core/description.dart';
import 'package:mp_chart/mp/core/entry/entry.dart';
import 'package:mp_chart/mp/core/entry/pie_entry.dart';
import 'package:mp_chart/mp/core/enums/legend_horizontal_alignment.dart';
import 'package:mp_chart/mp/core/enums/legend_orientation.dart';
import 'package:mp_chart/mp/core/enums/legend_vertical_alignment.dart';
import 'package:mp_chart/mp/core/enums/value_position.dart';
import 'package:mp_chart/mp/core/highlight/highlight.dart';
import 'package:mp_chart/mp/core/image_loader.dart';
import 'package:mp_chart/mp/core/render/pie_chart_renderer.dart';
import 'package:mp_chart/mp/core/utils/color_utils.dart';
import 'package:mp_chart/mp/core/value_formatter/percent_formatter.dart';

import 'myPortfolio_state.dart';

class MyPortfolioLogic extends GetxController implements OnChartValueSelectedListener {
  final MyPortfolioState state = MyPortfolioState();
  var random = Random(1);
  final int _count = 4;
  final double _range = 100.0;

  @override
  void onInit() {
    _initController();
    _initPieData(_count, _range);
    super.onInit();
  }

  final List<String> PARTIES = ["Party A",
    "Party B",
    "Party C",
    "Party D",
    "Party E",
    "Party F",
    "Party G",
    "Party H",
    "Party I",
    "Party J",
    "Party K",
    "Party L",
    "Party M",
    "Party N",
    "Party O",
    "Party P",
    "Party Q",
    "Party R",
    "Party S",
    "Party T",
    "Party U",
    "Party V",
    "Party W",
    "Party X",
    "Party Y",
    "Party Z"];

  void _initController() {
    var desc = Description()..enabled = false;
    state.controller = PieChartController(
        legendSettingFunction: (legend, controller) {
          _formatter.setPieChartPainter(controller);
          legend
            ..verticalAlignment = (LegendVerticalAlignment.TOP)
            ..horizontalAlignment = (LegendHorizontalAlignment.RIGHT)
            ..orientation = (LegendOrientation.VERTICAL)
            ..drawInside = (false)
            ..enabled = (false);
        },
        rendererSettingFunction: (renderer) {
          (renderer as PieChartRenderer)
            ..setHoleColor(ColorUtils.WHITE)
            ..setHoleColor(ColorUtils.WHITE)
            ..setTransparentCircleColor(ColorUtils.WHITE)
            ..setTransparentCircleAlpha(110);
        },
        rotateEnabled: true,
        drawHole: true,
        drawCenterText: true,
        extraLeftOffset: 20,
        extraTopOffset: 0,
        extraRightOffset: 20,
        extraBottomOffset: 0,
        usePercentValues: true,
        centerText: "value lines",
        holeRadiusPercent: 58,
        transparentCircleRadiusPercent: 61,
        highLightPerTapEnabled: false,
        selectionListener: this,
        description: desc
    );
  }

  final PercentFormatter _formatter = PercentFormatter();

  void _initPieData(int count, double range) async {
    var img = await ImageLoader.loadImage('assets/img/star.png');
    List<PieEntry> entries = [];

    // NOTE: The order of the entries when being added to the entries array determines their position around the center of
    // the chart.
    for (int i = 0; i < count; i++) {
      entries.add(PieEntry(
          icon: img,
          value: (random.nextDouble() * range) + range / 5,
          label: PARTIES[i % PARTIES.length],
          labelColor: ColorUtils.BLACK,
          labelTextSize: 15));
    }

    PieDataSet dataSet = new PieDataSet(entries, "Election Results");
    dataSet.setSliceSpace(3);
    dataSet.setSelectionShift(5);

    // add a lot of colors
    List<Color> colors = [];
    for (Color c in ColorUtils.VORDIPLOM_COLORS) {
      colors.add(c);
    }
    for (Color c in ColorUtils.JOYFUL_COLORS) {
      colors.add(c);
    }
    for (Color c in ColorUtils.COLORFUL_COLORS) {
      colors.add(c);
    }
    for (Color c in ColorUtils.LIBERTY_COLORS) {
      colors.add(c);
    }
    for (Color c in ColorUtils.PASTEL_COLORS) {
      colors.add(c);
    }
    colors.add(ColorUtils.HOLO_BLUE);
    dataSet.setColors1(colors);
    dataSet.setSelectionShift(0);

    dataSet.setValueLinePart1OffsetPercentage(80.0);
    dataSet.setValueLinePart1Length(0.2);
    dataSet.setValueLinePart2Length(0.4);

    dataSet.setYValuePosition(ValuePosition.OUTSIDE_SLICE);

    state.controller.data = PieData(dataSet)
      ..setValueFormatter(_formatter)
      ..setValueTextSize(11)
      ..setValueTextColor(ColorUtils.BLACK)
      ..setValueTypeface(Util.REGULAR);
  }

  @override
  void onNothingSelected() {
    // TODO: implement onNothingSelected
  }

  @override
  void onValueSelected(Entry e, Highlight h) {
    // TODO: implement onValueSelected
  }

}
