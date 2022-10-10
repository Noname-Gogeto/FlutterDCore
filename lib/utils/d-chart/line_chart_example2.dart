import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartSample2 extends StatefulWidget {
  const LineChartSample2({Key? key}) : super(key: key);

  @override
  State<LineChartSample2> createState() => _LineChartSample2State();
}

class _LineChartSample2State extends State<LineChartSample2> {
  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  bool showAvg = false;

  //* date data
  int datediff = 30;
  int cuurrentMonth = DateTime.now().month;

  get lineTouchData {
    return LineTouchData(
      handleBuiltInTouches: true,
      touchTooltipData: LineTouchTooltipData(
        tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AspectRatio(
        aspectRatio: 1.25,
        child: Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                color: Colors.orange,
                blurRadius: 3,
                spreadRadius: 0,
                //offset: Offset(-2,2)
              )
            ],
            borderRadius: BorderRadius.circular(5),
          ),
          child: Stack(
            children: [
              SizedBox(
                width: 80,
                height: 20,
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      showAvg = !showAvg;
                    });
                  },
                  child: Text(
                    'Trung bình',
                    style: TextStyle(
                        fontSize: 13,
                        color: showAvg
                            ? Colors.black.withOpacity(0.5)
                            : Colors.black),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  // const Text(
                  //   'Happy home 2022',
                  //   style: TextStyle(
                  //     color: Colors.black,
                  //     fontSize: 24,
                  //     fontWeight: FontWeight.bold,
                  //     letterSpacing: 2,
                  //   ),
                  //   textAlign: TextAlign.center,
                  // ),
                  const SizedBox(
                    height: 4,
                  ),
                  const Text(
                    'Trung bình doanh số tháng 8',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          right: 20, left: 5, top: 10, bottom: 10),
                      child: LineChart(
                        showAvg ? avgData() : mainData(),
                      ),
                    ),
                  ),
                  const Divider(color: Colors.transparent),
                  Row(
                    children: const [
                      Icon(Icons.note),
                      Text('Chú thích:'),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff68737d),
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
    Widget text;
    switch (value.toInt()) {
      case 1:
        text = Text('${(datediff / 7 * (value + 1) / 2).ceil()}', style: style);
        break;
      case 3:
        text = Text('${(datediff / 7 * (value + 1) / 2).ceil()}', style: style);
        break;
      case 5:
        text = Text('${(datediff / 7 * (value + 1) / 2).ceil()}', style: style);
        break;
      case 7:
        text = Text('${(datediff / 7 * (value + 1) / 2).ceil()}', style: style);
        break;
      case 9:
        text = Text('${(datediff / 7 * (value + 1) / 2).ceil()}', style: style);
        break;
      case 11:
        text = Text('${(datediff / 7 * (value + 1) / 2).ceil()}', style: style);
        break;
      case 13:
        text = Text('${(datediff / 7 * (value + 1) / 2).ceil()}', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 8.0,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff67727d),
      fontWeight: FontWeight.bold,
      fontSize: 15,
    );
    String text;
    switch (value.toInt()) {
      case 1:
        text = '20';
        break;
      case 3:
        text = '60';
        break;
      case 5:
        text = '100';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  LineChartData mainData() {
    return LineChartData(
      lineTouchData: lineTouchData,
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
          show: true,
          border: Border.all(color: const Color(0xff37434d), width: 1)),
      minX: 0,
      maxX: 13,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: [
            const FlSpot(0, 3),
            const FlSpot(1, 2.8),
            const FlSpot(2, 2.9),
            const FlSpot(3, 3.8),
            const FlSpot(4, 3.9),
            const FlSpot(5, 3.8),
            const FlSpot(6, 3.4),
            const FlSpot(7, 3.4),
            const FlSpot(8, 3.6),
            const FlSpot(9, 3.8),
            const FlSpot(10, 3.9),
            const FlSpot(11, 3.8),
            const FlSpot(12, 3.4),
            const FlSpot(13, 3.4),
          ],
          isCurved: true,
          gradient: const LinearGradient(
            colors: [
              Color.fromARGB(255, 230, 180, 30),
              Color(0xffaeea7b),
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          barWidth: 3,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            color: Colors.transparent,
            // gradient: LinearGradient(
            //   colors: gradientColors
            //       .map((color) => color.withOpacity(0.3))
            //       .toList(),
            //   begin: Alignment.centerLeft,
            //   end: Alignment.centerRight,
            // ),
          ),
        ),
        LineChartBarData(
          spots: const [
            FlSpot(0, 3),
            FlSpot(2.6, 2),
            FlSpot(4.9, 5),
            FlSpot(6.8, 3.1),
            FlSpot(8, 4),
            FlSpot(9.5, 3),
            FlSpot(11, 4),
            FlSpot(11.7, 3),
            FlSpot(13, 4.3),
          ],
          isCurved: true,
          gradient: LinearGradient(
            colors: gradientColors,
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          barWidth: 3,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            color: Colors.transparent,
            // gradient: LinearGradient(
            //   colors: gradientColors
            //       .map((color) => color.withOpacity(0.3))
            //       .toList(),
            //   begin: Alignment.centerLeft,
            //   end: Alignment.centerRight,
            // ),
          ),
        ),
      ],
    );
  }

  LineChartData avgData() {
    return LineChartData(
      lineTouchData: LineTouchData(enabled: false),
      gridData: FlGridData(
        show: true,
        drawHorizontalLine: true,
        verticalInterval: 1,
        horizontalInterval: 1,
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            getTitlesWidget: bottomTitleWidgets,
            interval: 1,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
            interval: 1,
          ),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      ),
      borderData: FlBorderData(
          show: true,
          border: Border.all(color: const Color(0xff37434d), width: 1)),
      minX: 0,
      maxX: 13,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 3.44),
            FlSpot(2.6, 3.44),
            FlSpot(4.9, 3.44),
            FlSpot(6.8, 3.44),
            FlSpot(8, 3.44),
            FlSpot(9.5, 3.44),
            FlSpot(11, 3.44),
            FlSpot(12, 3.44),
            FlSpot(13, 3.44),
          ],
          isCurved: true,
          gradient: LinearGradient(
            colors: [
              ColorTween(begin: gradientColors[0], end: gradientColors[1])
                  .lerp(0.2)!,
              ColorTween(begin: gradientColors[0], end: gradientColors[1])
                  .lerp(0.2)!,
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          barWidth: 3,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: [
                ColorTween(begin: gradientColors[0], end: gradientColors[1])
                    .lerp(0.2)!
                    .withOpacity(0.1),
                ColorTween(begin: gradientColors[0], end: gradientColors[1])
                    .lerp(0.2)!
                    .withOpacity(0.1),
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
      ],
    );
  }
}
