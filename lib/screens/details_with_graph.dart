import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  final String? username;

  const Details({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    print(username);
    return Scaffold(
      body: Center(
        child: AspectRatio(
          aspectRatio: 1.6,
          child: Container(
            margin: const EdgeInsets.all(10),
            child: LineChart(LineChartData(
                gridData: const FlGridData(show: false),
                titlesData: const FlTitlesData(
                  topTitles:
                      AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  bottomTitles:
                      AxisTitles(sideTitles: SideTitles(showTitles: false)),
                ),
                lineBarsData: [
                  LineChartBarData(
                      spots: const [
                        FlSpot(1, 0),
                        FlSpot(2, 4),
                        FlSpot(3, 3),
                        FlSpot(4, 4),
                        FlSpot(5, 5),
                        FlSpot(6, 4),
                        FlSpot(7, 5),
                        FlSpot(8, 6),
                        FlSpot(9, 4),
                        FlSpot(10, 5),
                        FlSpot(11, 7),
                        FlSpot(12, 3),
                        FlSpot(13, 5),
                        FlSpot(14, 4),
                        FlSpot(15, 5),
                        FlSpot(16, 6),
                        FlSpot(17, 4),
                        FlSpot(18, 3),
                        FlSpot(19, 4),
                        FlSpot(20, 5),
                        FlSpot(21, 7),
                        FlSpot(22, 3),
                        FlSpot(23, 5),
                        FlSpot(24, 4),
                        FlSpot(25, 5),
                        FlSpot(26, 6),
                        FlSpot(27, 4),
                        FlSpot(28, 3),
                        FlSpot(29, 4),
                      ],
                      barWidth: 2,
                      isCurved: false,
                      color: Colors.blue.withOpacity(0.6),
                      belowBarData: BarAreaData(
                        show: true,
                        color: Colors.blue,
                        gradient: LinearGradient(
                          colors: [
                            Colors.blue.withOpacity(0.25),
                            Colors.blue.withOpacity(0.05),
                            //Colors.transparent,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      dotData: const FlDotData(show: false))
                ])),
          ),
        ),
      ),
    );
  }
}
