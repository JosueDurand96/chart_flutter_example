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
        title: Text('STADISTICA'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.only(top: 30,left: 30,right: 30),
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
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 30, right: 15),
                    height: 40,
                    width: 130,
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: TextFormField(
                      //  controller: departamentoControll,
                      decoration: InputDecoration.collapsed(
                        hintText: '978342756',
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 105),
                    padding: EdgeInsets.only(top: 10),
                    height: 40,
                    width: 60,
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: TextField(
                      //controller: provinciaControll,
                      decoration: InputDecoration.collapsed(
                        hintText: 'Validar',
                      ),
                      onTap: () {},
                    ),
                  ),

                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 30, right: 15),
                    height: 40,
                    width: 130,
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: TextFormField(
                      //  controller: departamentoControll,
                      decoration: InputDecoration.collapsed(
                        hintText: '978342756',
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 105),
                    padding: EdgeInsets.only(top: 10),
                    height: 40,
                    width: 60,
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: TextField(
                      //controller: provinciaControll,
                      decoration: InputDecoration.collapsed(
                        hintText: 'Validar',
                      ),
                      onTap: () {},
                    ),
                  ),

                ],
              ),
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
