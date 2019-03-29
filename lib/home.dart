
import 'package:chart_flutter_app/rest.dart';
import 'package:flutter/material.dart';

import 'package:charts_flutter/flutter.dart' as charts;

class MyHomePage extends StatefulWidget {
  final String title;
  final bool animate;
  final List<charts.Series> seriesList;
  MyHomePage({Key key, this.title, this.seriesList, this.animate})
      : super(key: key);
  @override
  _MyHomePageState createState() =>
      _MyHomePageState(title, animate, seriesList);
}

class _MyHomePageState extends State<MyHomePage> {
  final String title;
  final bool animate;
  final List<charts.Series> seriesList;

  _MyHomePageState(this.title, this.animate, this.seriesList);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Histórico de cambios'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(
              child: Padding(
                padding: EdgeInsets.only(top:10,right: 170),
                child: Text('Cancha 1',style: TextStyle(fontSize: 30),),
              )
            ),
            Expanded(
              flex: 0,
              child:Card(
                child:  Container(
                  margin: EdgeInsets.all(10),
                  padding:
                  EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 0),
                  height: 255,
                  width: 370,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: new charts.TimeSeriesChart(
                    _createSampleData(),
                    animate: animate,

                    /// Customize the gridlines to use a dash pattern.
                    primaryMeasureAxis: new charts.NumericAxisSpec(
                      renderSpec: charts.GridlineRendererSpec(
                        lineStyle: charts.LineStyleSpec(
                          dashPattern: [4, 4],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: ListOption(),
            ),
          ],
        ),
      ),
    );
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<MyRow, DateTime>> _createSampleData() {
    final data = [
//      new LinearSales('0', 5),
//      new LinearSales('0', 5),

      new MyRow(new DateTime(2018, 01, 14), 90),
      new MyRow(new DateTime(2018, 02, 21), 76),
      new MyRow(new DateTime(2018, 03, 23), 80),

//      new LinearSales('24 Oct', 15),
//      new LinearSales('31 Oct', 100),
//      new LinearSales('7 Nov', 120),
//      new LinearSales('14 Nov', 55),
    ];

    return [
      new charts.Series<MyRow, DateTime>(
        id: 'Cost',
        domainFn: (MyRow row, _) => row.timeStamp,
        measureFn: (MyRow row, _) => row.cost,
        data: data,
      )
    ];
  }
}

/// Sample time series data type.
class MyRow {
  final DateTime timeStamp;
  final int cost;
  MyRow(this.timeStamp, this.cost);
}
