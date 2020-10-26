import 'package:flutter/material.dart';

class form extends StatefulWidget {
  @override
  _formState createState() => _formState();
}

class _formState extends State<form> {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  List<String> locations = ['A', 'B', 'C', 'D'];
  String name = " ";
  int age = 0;
  String password = " ";
  String SelectedLocation = "A";
  String maritalStatus = "Single";
  bool termCheck = false;

  Future validate() async {
    if (_formkey.currentState.validate()) {
      print("Name:" + name);
      print("Password:" + password);
      print("Age:" + age.toString());
      print("Location:" + SelectedLocation);
      print("MaritalStatus:" + maritalStatus);
      print("TermChecked:" + termCheck.toString());
    } else {
      print("Not Valid");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: Text("Form"),
        centerTitle: true,
      ),
      body: Form(
          key: _formkey,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  maxLength: 10,
                  decoration: InputDecoration(labelText: "Username"),
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Please enter a Name";
                    }
                  },
                  onChanged: (value) {
                    setState(() {
                      name = value;
                    });
                  },
                ),
                TextFormField(
                  maxLength: 15,
                  obscureText: true,
                  decoration: InputDecoration(labelText: "Password"),
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Please enter a password";
                    }
                    if (value.length < 8) {
                      return "Password should be more than 8 character";
                    }
                  },
                  onChanged: (value) {
                    setState(() {
                      password = value;
                    });
                  },
                ),
                TextFormField(
                  maxLength: 2,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Age",
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Enter Age";
                    }
                  },
                  onChanged: (value) {
                    age = int.tryParse(value);
                  },
                ),
                DropdownButton(
                    hint: Text("Locations"),
                    value: SelectedLocation,
                    items: locations.map((locations) {
                      return DropdownMenuItem(
                        child: new Text(locations),
                        value: locations,
                      );
                    }).toList(),
                    onChanged: (newvalue) {
                      setState(() {
                        SelectedLocation = newvalue;
                      });
                    }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: RadioListTile(
                            title: Text('Single'),
                            value: 'Single',
                            groupValue: maritalStatus,
                            onChanged: (value) {
                              setState(() {
                                maritalStatus = value;
                              });
                            })),
                    Expanded(
                        child: RadioListTile(
                            title: Text('Married'),
                            value: 'Married',
                            groupValue: maritalStatus,
                            onChanged: (value) {
                              setState(() {
                                maritalStatus = value;
                              });
                            })),
                  ],
                ),
                CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    value: termCheck,
                    title: Text("Terms and Condition"),
                    onChanged: (value) {
                      setState(() {
                        termCheck = value;
                      });
                    }),
                MaterialButton(
                    color: Colors.deepPurpleAccent,
                    minWidth: 120.0,
                    height: 40.0,
                    shape: StadiumBorder(),
                    child: Text(
                      "Submit",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      validate();
                    })
              ],
            ),
          )),
    );
  }
}
