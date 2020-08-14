import 'package:flutter/material.dart';
import 'package:monitoringroom/components/rounded_button.dart';
import 'package:monitoringroom/components/database.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'editvalue.dart';

class electronics_room extends StatefulWidget {
  static const String id = 'electronics';
  @override
  _electronics_roomState createState() => _electronics_roomState();
}

class _electronics_roomState extends State<electronics_room> {
  Query _query;

  @override
  void initState() {
    Database.queryElectronics().then((Query query) {
      setState(() {
        _query = query;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget body = new ListView(
      children: <Widget>[
        new ListTile(
          title: Text("The list is empty ...."),
        ),
      ],
    );
    if (_query != null) {
      body = new FirebaseAnimatedList(
        query: _query,
        itemBuilder: (
          BuildContext context,
          DataSnapshot snapshot,
          Animation<double> animation,
          int index,
        ) {
          String mountainKey = snapshot.key;
          Map map = snapshot.value;
          String name = map['name'] as String;
          String val = map['value'] as String;
          print(name);

          return new Column(
            children: <Widget>[
              Card(
                child: new ListTile(
                  title: new Text('$name'),
                  onTap: () {
                    _edit(mountainKey);
                  },
                  leading: CircleAvatar(
                    child: Icon(Icons.memory),
                  ),
                ),
              ),
              new Divider(
                height: 2.0,
              ),
            ],
          );
        },
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Electronics room'),
      ),
      body: body,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _createMountain();
        },
      ),
    );
  }

  void _createMountain() {
    Database.createElectronicsSensors().then((String mountainKey) {
      _edit(mountainKey);
    });
  }

  void _edit(String mountainKey) {
    var route = new MaterialPageRoute(
      builder: (context) => new EditValuePage(mountainKey: mountainKey),
    );
    Navigator.of(context).push(route);
  }
}
