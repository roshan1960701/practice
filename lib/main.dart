import 'package:flutter/material.dart';
import 'package:prac1/DatabaseHelper.dart';
import 'package:prac1/HomePage.dart';
import 'package:prac1/SearchMap.dart';
import 'package:prac1/designs.dart';

void main() {
  runApp(myApp());
}

class myApp extends StatefulWidget {
  @override
  _myAppState createState() => _myAppState();
}

class _myAppState extends State<myApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Practice",
      home: designs(),
    );
  }
}

class homePage extends StatefulWidget {
  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  String name;
  String pass;

  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final dbhelper = DatabaseHelpr.instance;

  void insertdata() async {
    Map<String, dynamic> row = {
      DatabaseHelpr.columnUser: name,
      DatabaseHelpr.columnPass: pass
    };
    final id = await dbhelper.insert(row);
    print(id);
  }

  void queryall() async {
    var allrows = await dbhelper.queryall();
    allrows.forEach((row) {
      print(row);
    });
  }

  void querySpecific() async {
    var allrows = await dbhelper.querySpecific('Roshan');
    print(allrows);
  }

  void validate() {
    if (formkey.currentState.validate()) {
      // Navigator.push(context,
      //     MaterialPageRoute(builder: (context) => firstScreen(Value: name)));
      insertdata();
      print("Validate");
    } else {
      print("Not Vaidate");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
          key: formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
                child: TextFormField(
                    onChanged: (text) {
                      name = text;
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Please Enter Username";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(20.0),
                        hintText: "Username",
                        border: OutlineInputBorder())),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                child: TextFormField(
                    onChanged: (text) {
                      pass = text;
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return "required";
                      } else {
                        return null;
                      }
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(20.0),
                        hintText: "Password",
                        border: OutlineInputBorder())),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: MaterialButton(
                    color: Colors.green,
                    minWidth: 150,
                    height: 40.0,
                    elevation: 10.0,
                    child: Text(
                      "Submit",
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                    onPressed: () {
                      insertdata();
                      //validate();
                    }),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: MaterialButton(
                    color: Colors.green,
                    minWidth: 150,
                    height: 40.0,
                    elevation: 10.0,
                    child: Text(
                      "Show",
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                    onPressed: () {
                      queryall();
                    }),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: MaterialButton(
                    color: Colors.green,
                    minWidth: 150,
                    height: 40.0,
                    elevation: 10.0,
                    child: Text(
                      "Delete",
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                    onPressed: () {}),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: MaterialButton(
                    color: Colors.green,
                    minWidth: 150,
                    height: 40.0,
                    elevation: 10.0,
                    child: Text(
                      "Update",
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                    onPressed: () {}),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: MaterialButton(
                    color: Colors.green,
                    minWidth: 150,
                    height: 40.0,
                    elevation: 10.0,
                    child: Text(
                      "Query",
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                    onPressed: () {
                      querySpecific();
                    }),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: MaterialButton(
                    shape: StadiumBorder(),
                    color: Colors.blue,
                    minWidth: 150,
                    height: 40.0,
                    elevation: 20.0,
                    child: Text(
                      "MAP",
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                    onPressed: () {}),
              ),
            ],
          )),
    );
  }
}
