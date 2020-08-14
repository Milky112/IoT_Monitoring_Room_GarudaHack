import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:monitoringroom/components/database.dart';

class PhysicsDetail extends StatefulWidget {
  static String routeName = '/physics';

  final String DataKey;

  PhysicsDetail({Key key, this.DataKey}) : super(key: key);

  @override
  _PhyscisDetail createState() => new _PhyscisDetail();
}

class _PhyscisDetail extends State<PhysicsDetail> {
  final _nameFieldTextController = new TextEditingController();
  final _valueTempTextcontroller = new TextEditingController();
  final _valueHumidityTextController = new TextEditingController();
  final _valueLDRTextcontroller = new TextEditingController();
  String Motor_condition;

  StreamSubscription _subscriptionName;

  @override
  void initState() {
    _nameFieldTextController.clear();
    _valueTempTextcontroller.clear();

    Database.getPhysicsNameStream(widget.DataKey, _updateName)
        .then((StreamSubscription s) => _subscriptionName = s);

    Database.getPhysicsValueStream(widget.DataKey, _updatevalue)
        .then((StreamSubscription s) => _subscriptionName = s);

    Database.getPhysicsValueHumidityStream(widget.DataKey, _updatevalueHumidity)
        .then((StreamSubscription s) => _subscriptionName = s);

    Database.getPhysicsValueLDRStream(widget.DataKey, _updatevalueLDR)
        .then((StreamSubscription s) => _subscriptionName = s);

    Database.getPhysicsMotorValue(widget.DataKey, _updateMotorCondition)
        .then((StreamSubscription s) => _subscriptionName = s);

    super.initState();
  }

  @override
  void dispose() {
    if (_subscriptionName != null) {
      _subscriptionName.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Sensor's Read"),
      ),
      body: new ListView(
        children: <Widget>[
          new ListTile(
            title: new TextField(
              controller: _nameFieldTextController,
              decoration: new InputDecoration(
                  icon: new Icon(Icons.edit),
                  labelText: "Name",
                  hintText: "Enter the mountain name..."),
              onChanged: (String value) {
                Database.savePhysicsName(widget.DataKey, value);
              },
            ),
          ),
          new ListTile(
            title: new TextField(
              controller: _valueTempTextcontroller,
              decoration: new InputDecoration(
                  icon: new Icon(Icons.flare),
                  labelText: "Value Temp",
                  hintText: "Enter the value of data..."),
              onChanged: (String value) {
                Database.savePhysicsValueTemp(widget.DataKey, value);
              },
              enabled: false,
            ),
          ),
          new ListTile(
            title: new TextField(
              controller: _valueHumidityTextController,
              decoration: new InputDecoration(
                  icon: new Icon(Icons.invert_colors),
                  labelText: "Value Humidity",
                  hintText: "Enter the value of data..."),
              onChanged: (String value) {
                Database.savePhysicsValueHumidity(widget.DataKey, value);
              },
              enabled: false,
            ),
          ),
          new ListTile(
            title: new TextField(
              controller: _valueLDRTextcontroller,
              decoration: new InputDecoration(
                  icon: new Icon(Icons.lightbulb_outline),
                  labelText: "Lamp Condition",
                  hintText: "Enter the value of data..."),
              onChanged: (String value) {
                Database.savePhysicsValueLDR(widget.DataKey, value);
              },
              enabled: false,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.settings_power),
        onPressed: () {
          print('Float Button is clicked');
          print(Motor_condition);
          if (Motor_condition == 'ON') {
            Database.savePhysicsValueMotor(widget.DataKey, 'OFF');
          } else {
            Database.savePhysicsValueMotor(widget.DataKey, 'ON');
          }
        },
      ),
    );
  }

  void _updateName(String name) {
    _nameFieldTextController.value = _nameFieldTextController.value.copyWith(
      text: name,
    );
  }

  void _updatevalue(String val) {
    _valueTempTextcontroller.value = _valueTempTextcontroller.value.copyWith(
      text: val,
    );
  }

  void _updatevalueHumidity(String val) {
    _valueHumidityTextController.value =
        _valueHumidityTextController.value.copyWith(
      text: val,
    );
  }

  void _updatevalueLDR(String val) {
    _valueLDRTextcontroller.value = _valueLDRTextcontroller.value.copyWith(
      text: val,
    );
  }

  void _updateMotorCondition(String val) {
    Motor_condition = val;
  }
}
