import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internal_app/bloc/Admin/admin_bloc.dart';

final List<String> list = <String>['Cred', 'Siren', 'Chipotle', 'Four'];

class BarChartSample extends StatefulWidget {
  BarChartSample({super.key});

  List<Color> get availableColors => const <Color>[
        Colors.purple,
        Colors.yellow,
        Colors.blue,
        Colors.orange,
        Colors.pink,
        Colors.red,
      ];

  final Color barBackgroundColor = Colors.black.withOpacity(0.3);
  final Color barColor = Colors.white;
  final Color touchedBarColor = Color.fromARGB(215, 234, 234, 234);

  @override
  State<StatefulWidget> createState() => BarChartSample1State();
}

class BarChartSample1State extends State<BarChartSample> {
  final Duration animDuration = const Duration(milliseconds: 250);

  String dropdownValue = list.first;
  int touchedIndex = -1;

  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    // final int complete=context.read()
    return BlocBuilder<AdminBloc, AdminState>(
      builder: (context, state) {
        if (state is ApiFullFilled) {
          final double completed =
              (state as ApiFullFilled).onbRes.completed.toDouble();
          print(completed);
          final double failure =
              (state as ApiFullFilled).onbRes.failure.toDouble();
          print(failure);
          final double underReview =
              (state as ApiFullFilled).onbRes.underReview.toDouble();
          print(underReview);
          final double inProgress =
              (state as ApiFullFilled).onbRes.inProgress.toDouble();
          print(inProgress);
          return AspectRatio(
            aspectRatio: 1,
            child: Stack(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    const SizedBox(
                      height: 5,
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: DropdownMenu<String>(
                          width: 100,
                          inputDecorationTheme: InputDecorationTheme(
                              border: InputBorder.none, fillColor: Colors.grey),
                          initialSelection: list.first,
                          onSelected: (String? value) {
                            setState(() {
                              dropdownValue = value!;
                            });
                          },
                          dropdownMenuEntries: list
                              .map<DropdownMenuEntry<String>>((String value) {
                            return DropdownMenuEntry<String>(
                                value: value, label: value);
                          }).toList(),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: BarChart(
                          isPlaying
                              ? randomData()
                              : mainBarData(
                                  completed, failure, underReview, inProgress),
                          swapAnimationDuration: animDuration,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                  ],
                ),
              ],
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }

  BarChartGroupData makeGroupData(
    int x,
    double y, {
    bool isTouched = false,
    Color? barColor,
    double width = 30,
    List<int> showTooltips = const [],
  }) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: isTouched ? y + 1 : y,
          color: isTouched ? widget.touchedBarColor : barColor,
          width: width,
          borderSide: isTouched
              ? BorderSide(color: widget.touchedBarColor)
              : const BorderSide(color: Colors.white, width: 0),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 20,
            color: widget.barBackgroundColor,
          ),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }

  List<BarChartGroupData> showingGroups(double completed, double failure,
          double underReview, double inProgress) =>
      List.generate(4, (i) {
        switch (i) {
          case 0:
            return makeGroupData(0, completed,
                isTouched: i == touchedIndex, barColor: Colors.green.shade300);
          case 1:
            return makeGroupData(1, failure,
                isTouched: i == touchedIndex, barColor: Colors.red.shade400);
          case 2:
            return makeGroupData(2, underReview,
                isTouched: i == touchedIndex, barColor: Colors.orange.shade300);
          case 3:
            return makeGroupData(3, inProgress,
                isTouched: i == touchedIndex, barColor: Colors.blue.shade300);
          default:
            return throw Error();
        }
      });

  BarChartData mainBarData(
      double completed, double failure, double underReview, double inProgress) {
    return BarChartData(
      barTouchData: BarTouchData(
        touchTooltipData: BarTouchTooltipData(
          tooltipBgColor: Colors.green.shade100,
          tooltipHorizontalAlignment: FLHorizontalAlignment.right,
          tooltipMargin: -20,
          getTooltipItem: (group, groupIndex, rod, rodIndex) {
            String weekDay;
            switch (group.x) {
              case 0:
                weekDay = 'completed';
                break;
              case 1:
                weekDay = 'failure';
                break;
              case 2:
                weekDay = 'inProgress';
                break;
              case 3:
                weekDay = 'underReview';
                break;
              default:
                throw Error();
            }
            return BarTooltipItem(
              '$weekDay\n',
              const TextStyle(
                color: Color.fromARGB(255, 116, 116, 116),
                fontWeight: FontWeight.bold,
                fontSize: 9,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: (rod.toY - 1).toString(),
                  style: TextStyle(
                    color: Color.fromARGB(255, 28, 28, 28),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            );
          },
        ),
        touchCallback: (FlTouchEvent event, barTouchResponse) {
          setState(() {
            if (!event.isInterestedForInteractions ||
                barTouchResponse == null ||
                barTouchResponse.spot == null) {
              touchedIndex = -1;
              return;
            }
            touchedIndex = barTouchResponse.spot!.touchedBarGroupIndex;
          });
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: getTitles,
            reservedSize: 25,
          ),
        ),
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: true, reservedSize: 40),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: showingGroups(completed, failure, underReview, inProgress),
      gridData: const FlGridData(show: false),
    );
  }

  Widget getTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w300,
      fontSize: 10,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = const Text('completed', style: style);
        break;
      case 1:
        text = const Text('failure', style: style);
        break;
      case 2:
        text = const Text('inProgress', style: style);
        break;
      case 3:
        text = const Text('underReview', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 7,
      child: text,
    );
  }

  BarChartData randomData() {
    return BarChartData(
      barTouchData: BarTouchData(
        enabled: false,
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: getTitles,
            reservedSize: 38,
          ),
        ),
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: List.generate(4, (i) {
        switch (i) {
          case 0:
            return makeGroupData(0, Random().nextInt(15).toDouble() + 6,
                barColor: Colors.green, width: 2);
          case 1:
            return makeGroupData(
              1,
              Random().nextInt(15).toDouble() + 6,
              barColor: Colors.red,
            );
          case 2:
            return makeGroupData(
              2,
              Random().nextInt(15).toDouble() + 6,
              barColor: Colors.orange,
            );
          case 3:
            return makeGroupData(
              3,
              Random().nextInt(15).toDouble() + 6,
              barColor: Colors.purple,
            );
          default:
            return throw Error();
        }
      }),
      gridData: const FlGridData(show: false),
    );
  }

  // Future<dynamic> refreshState() async {
  //   setState(() {});
  //   await Future<dynamic>.delayed(
  //     animDuration + const Duration(milliseconds: 50),
  //   );
  //   if (isPlaying) {
  //     await refreshState();
  //   }
  // }
}
