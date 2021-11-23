import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'dart:math' as math;
class Home2 extends StatefulWidget {
  const Home2({Key? key}) : super(key: key);

  @override
  _Home2State createState() => _Home2State();
}

class _Home2State extends State<Home2> {
  late List<LiveData> chartData;
  late ChartSeriesController _chartSeriesController;

  @override
  void initState() {
    chartData = getChartData();
    Timer.periodic(const Duration(seconds: 1), updateDataSource);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.green[200],
      appBar: AppBar(),
      body:
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white
        ),
        height: height*0.4,
        width: width*0.5,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child:
          Container(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('VNIndex',style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                      ),),
                      Text('1,397.33',style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        color: Colors.green[300]
                      ),),
                    ],
                  ),
                 const SizedBox(
                   height: 10,
                 ),
                 Container(
                   height: height*0.18,
                          child:SfCartesianChart(
                              series: <SplineAreaSeries<LiveData, int>>[
                                SplineAreaSeries<LiveData, int>(
                                  onRendererCreated: (ChartSeriesController controller) {
                                    _chartSeriesController = controller;
                                  },
                                  dataSource: chartData,
                                  color: const Color.fromRGBO(192, 108, 132, 1),
                                  xValueMapper: (LiveData sales, _) => sales.time,
                                  yValueMapper: (LiveData sales, _) => sales.speed,
                                )
                              ],
                              primaryXAxis: NumericAxis(
                                  isVisible: false
                               ),
                              primaryYAxis: NumericAxis(
                                  isVisible: false
                                ))
                      ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('5.48',style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.green[300]
                      ),),
                      Text('0.39%',style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.green[300]
                      ),),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const Text('119,100,020',style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                      )),
                      Text('0.39%',style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: Colors.green[300]
                      ),),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const Text('3,172.09',style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      )),
                      Text('Tỷ',style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: Colors.green[300]
                      ),),
                    ],
                  )

                ],
              ),
          ),
        ),
      ),
    );

  }


  int time = 19;
  void updateDataSource(Timer timer) {
    chartData.add(LiveData(time++, (math.Random().nextInt(60) + 30)));
    chartData.removeAt(0);
    _chartSeriesController.updateDataSource(
        addedDataIndex: chartData.length - 1, removedDataIndex: 0);
  }

  List<LiveData> getChartData() {
    return <LiveData>[
      LiveData(0, 42),
      LiveData(1, 47),
      LiveData(2, 43),
      LiveData(3, 49),
      LiveData(4, 54),
      LiveData(5, 41),
      LiveData(6, 58),
      LiveData(7, 51),
      LiveData(8, 98),
      LiveData(9, 41),
      LiveData(10, 53),
      LiveData(11, 72),
      LiveData(12, 86),
      LiveData(13, 52),
      LiveData(14, 94),
      LiveData(15, 92),
      LiveData(16, 86),
      LiveData(17, 72),
      LiveData(18, 94)
    ];
  }
}

Widget chartWidget(
{
  String ? title,
  String ? price,
  ChartSeriesController ?controller,
  List<LiveData> ? chartData
}
    ){
  return Container(
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title??'VNIndex',style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20
            ),),
            Text(price??'1,397.33',style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.green[300]
            ),),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
            height: 150,
            child:SfCartesianChart(
                plotAreaBorderWidth: 0,
                series: <SplineAreaSeries<LiveData, int>>[
                  SplineAreaSeries<LiveData, int>(
                    onRendererCreated: (ChartSeriesController controller) {
                      controller = controller;
                    },
                    dataSource: chartData??[],
                    color: const Color.fromRGBO(192, 108, 132, 1),
                    xValueMapper: (LiveData sales, _) => sales.time,
                    yValueMapper: (LiveData sales, _) => sales.speed,
                  )
                ],
                primaryXAxis: NumericAxis(
                    isVisible: false
                ),
                primaryYAxis: NumericAxis(
                    isVisible: false
                ))
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('5.48',style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.green[300]
            ),),
            Text('0.39%',style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.green[300]
            ),),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            const Text('119,100,020',style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17,
            )),
            Text('0.39%',style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
                color: Colors.green[300]
            ),),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            const Text('3,172.09',style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17,
            )),
            Text('Tỷ',style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
                color: Colors.green[300]
            ),),
          ],
        )

      ],
    ),
  );
}
class LiveData {
  LiveData(this.time, this.speed);
  final int time;
  final num speed;
}

