import 'package:fl_chart/fl_chart.dart';
import "package:flutter/material.dart";

import '../config/styles.dart';

class CovidBarChart extends StatelessWidget {
  final List<double> covidCases;

  const CovidBarChart({Key? key, required this.covidCases}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child: const Text(
              "Daily New Cases",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width * 0.85,
            child: BarChart(
              BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  maxY: 16,
                  barTouchData: BarTouchData(
                    enabled: false,
                  ),
                  titlesData: FlTitlesData(
                    show: true,
                    bottomTitles: SideTitles(
                      margin: 10,
                      showTitles: true,
                      textStyle: Styles.chartLabelsTextStyle,
                      rotateAngle: 35,
                      getTitles: (double value) {
                        switch (value.toInt()) {
                          case 0:
                            return "May 24";
                          case 1:
                            return "May 25";
                          case 2:
                            return "May 26";
                          case 3:
                            return "May 27";
                          case 4:
                            return "May 28";
                          case 5:
                            return "May 29";
                          case 6:
                            return "May 30";
                          default:
                            return "";
                        }
                      },
                    ),
                    leftTitles: SideTitles(
                      margin: 10,
                      showTitles: true,
                      textStyle: Styles.chartLabelsTextStyle,
                      getTitles: (value) {
                        if (value == 0) {
                          return "0";
                        } else if (value % 3 == 0) {
                          return "${value ~/ 3 * 5}K";
                        }
                        return "";
                      },
                    ),
                  ),
                  gridData: FlGridData(
                    show: true,
                    checkToShowHorizontalLine: (value) => value % 3 == 0,
                    getDrawingHorizontalLine: (value) => FlLine(
                        color: Colors.black12, strokeWidth: 1, dashArray: [5]),
                  ),
                  borderData: FlBorderData(
                    show: false,
                  ),
                  barGroups: covidCases
                      .asMap()
                      .map(
                        (key, value) => MapEntry(
                          key,
                          BarChartGroupData(
                            x: key,
                            barRods: [
                              BarChartRodData(
                                y: value,
                                color: Colors.red,
                              ),
                            ],
                          ),
                        ),
                      )
                      .values
                      .toList()),
            ),
          ),
        ],
      ),
    );
  }
}
