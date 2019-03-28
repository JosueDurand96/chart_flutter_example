import 'package:chart_flutter_app/before.dart';
import 'package:chart_flutter_app/home.dart';
import 'package:chart_flutter_app/main.dart';
import 'package:flutter/material.dart';

class Oficial extends StatefulWidget {
  @override
  _OficialState createState() => _OficialState();
}

class _OficialState extends State<Oficial> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          child:  Before(),
        ),
        Container(
          margin: EdgeInsets.only(left: 30, right: 15),
          padding: EdgeInsets.only(top: 10),
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
      ],
    );

  }
}
