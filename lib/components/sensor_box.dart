import 'package:flutter/material.dart';

class sensorDisplay extends StatefulWidget {
  sensorDisplay(
      {this.numberSensor, this.lampCondition, this.temperature, this.humidity});
  final String numberSensor;
  String lampCondition;
  String temperature;
  String humidity;
  @override
  _sensorDisplayState createState() => _sensorDisplayState();
}

class _sensorDisplayState extends State<sensorDisplay> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 150,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 3,
        ),
      ),
      child: Column(
        children: <Widget>[
          SensorDisplayBox(),
          SizedBox(
            height: 20,
          ),
          temperatureData(
            suhu: widget.temperature,
          ),
          SizedBox(
            height: 10,
          ),
          humidityData(
            kelembapan: widget.humidity,
          ),
          SizedBox(
            height: 10,
          ),
          lampData(conditionLamp: widget.lampCondition),
        ],
      ),
    );
  }

  Padding SensorDisplayBox() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 35,
        width: 85,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 3,
          ),
        ),
        child: Center(
          child: Text(
            'Sensor - ${widget.numberSensor}',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.normal,
            ),
          ),
        ),
      ),
    );
  }
}

class lampData extends StatelessWidget {
  lampData({this.conditionLamp});
  String conditionLamp;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 30,
        ),
        Container(
          child: Image.asset('images/lamp.png'),
          height: 30,
        ),
        SizedBox(
          width: 20,
        ),
        Text(conditionLamp),
      ],
    );
  }
}

class humidityData extends StatelessWidget {
  humidityData({this.kelembapan});
  String kelembapan = '0';
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 35,
        ),
        Container(
          child: Image.asset('images/humidity.png'),
          height: 30,
        ),
        SizedBox(
          width: 20,
        ),
        Text(' '),
        Text('$kelembapan % '),
      ],
    );
  }
}

class temperatureData extends StatelessWidget {
  temperatureData({this.suhu});
  String suhu = '0';
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 35,
        ),
        Container(
          child: Image.asset('images/termometer.png'),
          height: 30,
        ),
        SizedBox(
          width: 15,
        ),
        Text('$suhu° C'),
      ],
    );
  }
}
