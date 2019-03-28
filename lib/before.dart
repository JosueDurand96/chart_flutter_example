import 'package:flutter/material.dart';

class Before extends StatefulWidget {
  @override
  _BeforeState createState() => _BeforeState();
}

class _BeforeState extends State<Before> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('before'),
      ),
      body: Container(
     child:   Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
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
            Padding(
              padding: EdgeInsets.only(),
            ),
          ],
        ),
      ),

    );
  }
}
