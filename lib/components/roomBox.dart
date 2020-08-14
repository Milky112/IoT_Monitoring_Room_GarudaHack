import 'package:flutter/material.dart';
import 'sensor_box.dart';
import 'dart:io';

class roomBox extends StatefulWidget {
  roomBox(
      {@required this.roomName,
      this.Ruang,
      this.Kondisikelembapan1,
      this.Kondisilampu1,
      this.Kondisisuhu1});
  final String roomName;
  String Kondisisuhu1;
  String Kondisikelembapan1;
  String Kondisilampu1;
  String Ruang;

  @override
  _roomBoxState createState() => _roomBoxState();
}

class _roomBoxState extends State<roomBox> {
  String suhu1;
  String kelembapan1;
  String lampu1;

  @override
  void initState() {
    super.initState();
    updateUI();
  }

  void updateUI() {
    setState(() {
      suhu1 = widget.Kondisisuhu1;
      kelembapan1 = widget.Kondisikelembapan1;
      lampu1 = widget.Kondisilampu1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('Hello Room ${widget.roomName}');
      },
      child: Container(
        height: 350,
        width: 350,
        decoration: BoxDecoration(
          color: Color(0XFFF0FBFE),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Color(0XFF94D9F1),
            width: 3,
          ),
//              image: DecorationImage(
//                image: new AssetImage('images/logo.jpg'),
//              ),
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                widget.roomName,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  sensorDisplay(
                    numberSensor: '1',
                    humidity: kelembapan1,
                    lampCondition: lampu1,
                    temperature: suhu1,
                  ),
                  sensorDisplay(
                    numberSensor: '2',
                    humidity: '52',
                    lampCondition: 'off',
                    temperature: '10',
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Informasi pada ruangan ${widget.roomName} Menunjukan ',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal,
                  fontSize: 14,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                'Ruangan Sedang Dipakai',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal,
                  fontSize: 14,
                ),
              ),
            )
          ],
        ),
        margin: EdgeInsets.only(top: 15, left: 15, right: 15),
      ),
    );
  }
}
