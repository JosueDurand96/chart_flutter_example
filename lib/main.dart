import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}


class MyHomePage extends StatelessWidget  {



  MyHomePage({Key key, this.title, this.seriesList, this.animate}) : super(key: key);
  final String title;
  final List< charts.Series> seriesList;
  //final List<charts.Series<dynamic, String>>seriesList;
  final bool animate;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       title: Text('STADISTICA'),
     ),
      body: new charts.LineChart(
          _createSampleData(),
        animate: animate,
        domainAxis: new charts.NumericAxisSpec(
          // Set the initial viewport by providing a new AxisSpec with the
          // desired viewport, in NumericExtents.
            viewport: new charts.NumericExtents(3.0, 7.0)),
        // Optionally add a pan or pan and zoom behavior.
        // If pan/zoom is not added, the viewport specified remains the viewport.
        behaviors: [new charts.PanAndZoomBehavior()],
      ),
    );
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<LinearSales, String>> _createSampleData() {
    final data = [
      new LinearSales('17 Oct', 5),
      new LinearSales('24 Oct', 15),
      new LinearSales('31 Oct', 100),
      new LinearSales('7 Nov', 120),
      new LinearSales('14 Nov', 55),
    ];


    return [
      new charts.Series<LinearSales, String>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sale,
        data: data,
      )
    ];
  }
}

/// Sample linear data type.
class LinearSales {
  final int year;
  final int sale;

  LinearSales(this.year, this.sale);

}