import 'package:flutter/material.dart';
import 'package:monitoringroom/components/rounded_button.dart';
import 'package:monitoringroom/components/messagebox.dart';
import 'list_room_screen.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:url_launcher/url_launcher.dart';

class WelcomeScreen extends StatelessWidget {
  static const String id = 'welcome_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                InkWell(
                  onTap: () => launch('https://pngtree.com/so/17-august'),
                  child: Container(
                    margin: EdgeInsets.only(top: 25, left: 40, right: 20),
                    child: Image.asset('images/garudaLogo1.png'),
                    height: 250,
                  ),
                ),
              ],
            ),
            Center(
              child: Text(
                'Garuda Hacks Competition 2020',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Center(
              child: Text(
                'IoT Monitoring Room',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: FlatButton(
                color: Colors.white,
                textColor: Colors.black,
                disabledColor: Colors.grey,
                disabledTextColor: Colors.black,
                padding: EdgeInsets.all(8.0),
                splashColor: Colors.blueAccent,
                onPressed: () {
                  Alert(
                    context: context,
                    title: 'About',
                    desc:
                        "IoT Monitoring Room version 0.1 for Garuda Hacks Competition",
                    buttons: [
                      DialogButton(
                        child: Text(
                          "Ok",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        onPressed: () => Navigator.pop(context),
                        width: 120,
                      )
                    ],
                  ).show();
                },
                child: Icon(
                  Icons.help,
                  color: Colors.grey,
                  size: 35,
                ),
              ),
            ),
            SizedBox(
              height: 100.0,
            ),
            roundedButton(
              onPress: () {
                Navigator.pushNamed(context, listRoomScreen.id);
              },
              title: 'Next',
              height: 80,
              width: 100,
              color: Colors.lightBlueAccent,
            ),
          ],
        ),
      ),
    );
  }
}
