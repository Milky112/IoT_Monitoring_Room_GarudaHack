import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:monitoringroom/screens/electronics_room.dart';
import 'package:monitoringroom/screens/physics_room.dart';

class listRoomScreen extends StatefulWidget {
  static const String id = 'list_room';

  @override
  _listRoomScreenState createState() => _listRoomScreenState();
}

class _listRoomScreenState extends State<listRoomScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0XFF94D9F1),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('images/lightblue1.jpg'),
            fit: BoxFit.cover,
          )),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 35,
                      bottom: 5,
                    ),
                    child: Text(
                      "Welcome to IoT Room Monitoring",
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: <Widget>[
                      list_of_room(
                        callback: () {
                          print('object from Electronics');
                          Navigator.pushNamed(context, electronics_room.id);
                        },
                        roomName: 'Electronics Room',
                        roomDetail: 'Electronics & Circuit Analysis Practicum',
                        path: 'images/L1D_648.jpg',
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      list_of_room(
                        callback: () {
                          print('object from physics');
                          Navigator.pushNamed(context, physics_room.id);
                        },
                        roomName: 'Physics Room',
                        roomDetail: 'Physics 1 & Physics 2 Practicum',
                        path: 'images/L1E_648.jpg',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class list_of_room extends StatelessWidget {
  list_of_room(
      {@required this.callback, this.roomName, this.roomDetail, this.path});
  final Function callback;
  final String roomName;
  final String roomDetail;
  final String path;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        width: 400,
        height: 300,
        decoration: BoxDecoration(
          color: Color(0XFFF0FBFE),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Color(0XFF94D9F1),
            width: 3,
          ),
        ),
        child: Column(
          children: <Widget>[
            Text(
              '$roomName',
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Image.asset(path),
                height: 200,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 6, bottom: 10),
              child: Text(
                '$roomDetail',
                style: TextStyle(
                    fontSize: 17,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
