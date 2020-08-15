import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:monitoringroom/components/database.dart';

class EditValuePage extends StatefulWidget {
  static String routeName = '/edit_mountain';

  final String mountainKey;

  EditValuePage({Key key, this.mountainKey}) : super(key: key);

  @override
  _EditValuePageState createState() => new _EditValuePageState();
}

class _EditValuePageState extends State<EditValuePage> {
  final _nameFieldTextController = new TextEditingController();
  final _valueTempTextcontroller = new TextEditingController();
  final _valueHumidityTextController = new TextEditingController();
  final _valueLDRTextcontroller = new TextEditingController();
  String Motor_condition;
  String Lamp_Condition;

  StreamSubscription _subscriptionName;

  @override
  void initState() {
    _nameFieldTextController.clear();
    _valueTempTextcontroller.clear();

    Database.getNameStream(widget.mountainKey, _updateName)
        .then((StreamSubscription s) => _subscriptionName = s);

    Database.getValueStream(widget.mountainKey, _updatevalue)
        .then((StreamSubscription s) => _subscriptionName = s);

    Database.getValueHumidityStream(widget.mountainKey, _updatevalueHumidity)
        .then((StreamSubscription s) => _subscriptionName = s);

    Database.getValueLDRStream(widget.mountainKey, _updatevalueLDR)
        .then((StreamSubscription s) => _subscriptionName = s);

    Database.getMotorValue(widget.mountainKey, _updateMotorCondition)
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
                Database.saveName(widget.mountainKey, value);
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
                Database.saveValueTemp(widget.mountainKey, value);
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
                Database.saveValueHumidity(widget.mountainKey, value);
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
                Database.saveValueLDR(widget.mountainKey, value);
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
          if (Lamp_Condition == 'OFF') {
            Database.saveValueMotor(widget.mountainKey, 'ON');
            Future.delayed(const Duration(milliseconds: 2000), () {
              setState(() {
                Database.saveValueMotor(widget.mountainKey, '0');
              });
            });
          } else {
            if (Lamp_Condition == 'ON') {
              Database.saveValueMotor(widget.mountainKey, 'OFF');
              Future.delayed(const Duration(milliseconds: 2000), () {
                setState(() {
                  Database.saveValueMotor(widget.mountainKey, '0');
                });
              });
            }
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
    Lamp_Condition = val;
  }

  void _updateMotorCondition(String val) {
    Motor_condition = val;
  }
}
