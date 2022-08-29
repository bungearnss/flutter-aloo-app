import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import 'package:flutter_aloo_app/utils/app_color.dart';

class ActivityGraph extends StatefulWidget {
  const ActivityGraph({Key? key}) : super(key: key);

  @override
  State<ActivityGraph> createState() => _ActivityGraphState();
}

class _ActivityGraphState extends State<ActivityGraph> {
  late List<BarChartGroupData> rawBarGroups;
  late List<BarChartGroupData> showingBarGroups;

  int touchedGroupIndex = -1;

  @override
  void initState() {
    super.initState();
    final barGroup1 = makeGroupData(0, 5);
    final barGroup2 = makeGroupData(1, 16);
    final barGroup3 = makeGroupData(5, 18);
    final barGroup4 = makeGroupData(7, 20);
    final barGroup5 = makeGroupData(4, 17);
    final barGroup6 = makeGroupData(10, 19);
    final barGroup7 = makeGroupData(5, 10);
    final barGroup8 = makeGroupData(0, 10);
    final barGroup9 = makeGroupData(8, 10);
    final barGroup10 = makeGroupData(1, 5);
    final barGroup11 = makeGroupData(10, 19);
    final barGroup12 = makeGroupData(2, 12);
    final barGroup13 = makeGroupData(4, 8);
    final barGroup14 = makeGroupData(5, 14);
    final barGroup15 = makeGroupData(0, 5);
    final barGroup16 = makeGroupData(5, 6);
    final barGroup17 = makeGroupData(5, 13);
    final barGroup18 = makeGroupData(4, 18);
    final barGroup19 = makeGroupData(4, 10);
    final barGroup20 = makeGroupData(5, 7);

    final items = [
      barGroup1,
      barGroup2,
      barGroup3,
      barGroup4,
      barGroup5,
      barGroup6,
      barGroup7,
      barGroup8,
      barGroup9,
      barGroup10,
      barGroup11,
      barGroup12,
      barGroup13,
      barGroup14,
      barGroup15,
      barGroup16,
      barGroup17,
      barGroup18,
      barGroup19,
      barGroup20,
    ];

    rawBarGroups = items;

    showingBarGroups = rawBarGroups;
  }

  BarChartGroupData makeGroupData(int x, double y) {
    return BarChartGroupData(barsSpace: 2, x: x, barRods: [
      BarChartRodData(
        fromY: x.toDouble(),
        toY: y,
        color: AppColors.primaryColor,
        width: 3,
        backDrawRodData: BackgroundBarChartRodData(
          color: AppColors.greyColor.withOpacity(0.2),
          show: true,
          fromY: x.toDouble() - y,
          toY: 20.0,
        ),
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5, left: 20, right: 20, bottom: 100),
      height: 130,
      child: BarChart(
        BarChartData(
          barTouchData: BarTouchData(
              touchTooltipData: BarTouchTooltipData(
                tooltipBgColor: Colors.grey[300],
                getTooltipItem: (_a, _b, _c, _d) => null,
              ),
              touchCallback: (FlTouchEvent event, response) {
                if (response == null || response.spot == null) {
                  setState(() {
                    touchedGroupIndex = -1;
                    showingBarGroups = List.of(rawBarGroups);
                  });
                  return;
                }

                touchedGroupIndex = response.spot!.touchedBarGroupIndex;

                setState(() {
                  if (!event.isInterestedForInteractions) {
                    touchedGroupIndex = -1;
                    showingBarGroups = List.of(rawBarGroups);
                    return;
                  }
                  showingBarGroups = List.of(rawBarGroups);
                  if (touchedGroupIndex != -1) {
                    var sum = 0.0;
                    for (var rod
                        in showingBarGroups[touchedGroupIndex].barRods) {
                      sum += rod.toY;
                    }
                    final avg = sum /
                        showingBarGroups[touchedGroupIndex].barRods.length;

                    showingBarGroups[touchedGroupIndex] =
                        showingBarGroups[touchedGroupIndex].copyWith(
                      barRods: showingBarGroups[touchedGroupIndex]
                          .barRods
                          .map((rod) {
                        return rod.copyWith(toY: avg);
                      }).toList(),
                    );
                  }
                });
              }),
          titlesData: FlTitlesData(
            show: true,
            rightTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            topTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: false,
              ),
            ),
          ),
          borderData: FlBorderData(
            show: false,
          ),
          barGroups: showingBarGroups,
          gridData: FlGridData(show: false),
        ),
      ),
    );
  }
}
