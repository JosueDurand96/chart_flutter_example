import 'package:chart_flutter_app/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ListOption extends StatelessWidget {
  Future<List<User>> _getUsers() async {
    var data = await http
        .get("http://www.json-generator.com/api/json/get/cfwZmvEBbC?indent=2");
    //  var data = await http.post("http://192.168.1.61:8084/api/administrador/find?=1");

    var jsonData = json.decode(data.body);
    List<User> users = [];
    for (var u in jsonData) {
      User user =
          User(u["index"], u["about"], u["name"], u["email"], u["picture"]);
      users.add(user);
    }

    return users;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Card(
              margin: EdgeInsets.all( 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 15, top: 10),
                    height: 40,
                    width: 41,
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: SizedBox(
                      //  controller: departamentoControll,
                      child: Text('Diurna'),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20, top: 10),
                    height: 40,
                    width: 70,
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: SizedBox(
                      //  controller: departamentoControll,
                      child: Text('Nocturna'),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left:10, top: 10),
                    height: 40,
                    width: 90,
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: SizedBox(
                      //  controller: departamentoControll,
                      child: Text('Fecha'),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 32, top: 10),
                    height: 40,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: SizedBox(
                      //  controller: departamentoControll,
                      child: Text('Por'),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: FutureBuilder(
                future: _getUsers(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  print(snapshot.data);
                  if (snapshot.data == null) {
                    return Container(
                      child: Center(
                        child: Text("Cargando..."),
                      ),
                    );
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                        );
                        return Card(
                          margin: EdgeInsets.only(
                              left: 5, right: 6, bottom: 10, top: 10),
                          child: Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[

                                     Container(

                                      padding: EdgeInsets.only(left:10 ,top: 10),
                                      height: 45,
                                      width: 80,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                      ),
                                      child: TextField(
                                        //  controller: departamentoControll,
                                        decoration: InputDecoration.collapsed(
                                          hintText: 'S/.95.00',
                                          hintStyle: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black
                                          ),
                                        ),
                                      ),
                                    ),

                                  Container(
                                    padding: EdgeInsets.only(left: 10,top: 10),
                                    height: 45,
                                    width: 90,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                    ),
                                    child: TextField(
                                      //  controller: departamentoControll,
                                      decoration: InputDecoration.collapsed(
                                        hintText: 'S/.100.00',
                                        hintStyle: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black
                                        ),
                                      ),
                                    ),
                                  ),

                                     Container(
                                      margin: EdgeInsets.only(
                                        left: 0,
                                        right: 0,
                                      ),
                                      padding: EdgeInsets.only(left:10,top: 10),
                                      height: 45,
                                      width: 100,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                      ),
                                      child: TextField(
                                        //  controller: departamentoControll,
                                        decoration: InputDecoration.collapsed(
                                          hintText: '12/04/2019',
                                          hintStyle: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black
                                          ),
                                        ),
                                      ),
                                    ),

                                  Expanded(
                                    child:    Row(

                                      children: <Widget>[
                                        Expanded(child:  Container(
                                          padding: EdgeInsets.only(left:20,top: 10),

                                          height: 45,
                                          width: 180,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                          ),
                                          child: TextFormField(
                                            decoration: InputDecoration.collapsed(
                                              hintText: snapshot.data[index].name,
                                              hintStyle: TextStyle(
                                                fontSize: 16,
                                                color: Colors.black
                                              ),
                                            ),
                                            //controller: provinciaControll,
                                          ),
                                        ),),

                                      ],
                                    )
                                  ),

                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
