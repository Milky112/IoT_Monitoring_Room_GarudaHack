import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';
import 'screens/list_room_screen.dart';
import 'screens/electronics_room.dart';
import 'screens/physics_room.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WelcomeScreen(),
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        listRoomScreen.id: (context) => listRoomScreen(),
        electronics_room.id: (context) => electronics_room(),
        physics_room.id: (context) => physics_room(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
