import 'dart:async';

import 'package:firebase_database/firebase_database.dart';

class Database {
  static Future<String> createElectronicsSensors() async {
    String accountKey = await _getAccountKey();
    var mountain = <String, dynamic>{
      'name': '',
    };

    DatabaseReference reference = FirebaseDatabase.instance
        .reference()
        .child("sensors")
        .child(accountKey)
        .child("readsensors")
        .push();

    reference.set(mountain);

    return reference.key;
  }

  static Future<String> createPhysicsSensors() async {
    String accountKey = await _getAccountKey();
    var mountain = <String, dynamic>{
      'name': '',
    };

    DatabaseReference reference = FirebaseDatabase.instance
        .reference()
        .child("physics")
        .child(accountKey)
        .child("readsensors")
        .push();

    reference.set(mountain);

    return reference.key;
  }

  static Future<void> saveName(String mountainKey, String name) async {
    String val;
    String accountKey = await _getAccountKey();
    if (name != null) {
      val = name;
    } else {
      val = ' ';
    }

    return FirebaseDatabase.instance
        .reference()
        .child("sensors")
        .child(accountKey)
        .child("readsensors")
        .child(mountainKey)
        .child('name')
        .set(val);
  }

  static Future<void> saveValueTemp(
      String mountainKey, String valueTemp) async {
    String accountKey = await _getAccountKey();

    return FirebaseDatabase.instance
        .reference()
        .child("sensors")
        .child(accountKey)
        .child("readsensors")
        .child(mountainKey)
        .child('value')
        .set(valueTemp);
  }

  static Future<void> saveValueHumidity(
      String mountainKey, String valueHumidity) async {
    String accountKey = await _getAccountKey();

    return FirebaseDatabase.instance
        .reference()
        .child("sensors")
        .child(accountKey)
        .child("readsensors")
        .child(mountainKey)
        .child('humidity')
        .set(valueHumidity);
  }

  static Future<void> saveValueLDR(String mountainKey, String valueLDR) async {
    String accountKey = await _getAccountKey();

    return FirebaseDatabase.instance
        .reference()
        .child("sensors")
        .child(accountKey)
        .child("readsensors")
        .child(mountainKey)
        .child('LDR')
        .set(valueLDR);
  }

  static Future<void> saveValueMotor(String mountainKey, String motor) async {
    String accountKey = await _getAccountKey();

    return FirebaseDatabase.instance
        .reference()
        .child("sensors")
        .child(accountKey)
        .child("readsensors")
        .child(mountainKey)
        .child('motor')
        .set(motor);
  }

  static Future<StreamSubscription<Event>> getNameStream(
      String mountainKey, void onData(String name)) async {
    String accountKey = await _getAccountKey();

    StreamSubscription<Event> subscription = FirebaseDatabase.instance
        .reference()
        .child("sensors")
        .child(accountKey)
        .child("readsensors")
        .child(mountainKey)
        .child("name")
        .onValue
        .listen((Event event) {
      String name = event.snapshot.value as String;
      if (name == null) {
        name = "";
      }
      onData(name);
    });

    return subscription;
  }

  static Future<StreamSubscription<Event>> getValueStream(
      String mountainKey, void onData(String name)) async {
    String accountKey = await _getAccountKey();

    StreamSubscription<Event> subscription = FirebaseDatabase.instance
        .reference()
        .child("sensors")
        .child(accountKey)
        .child("readsensors")
        .child(mountainKey)
        .child("value")
        .onValue
        .listen((Event event) {
      String name = event.snapshot.value as String;
      if (name == null) {
        name = "";
      }
      onData(name);
    });

    return subscription;
  }

  static Future<StreamSubscription<Event>> getValueHumidityStream(
      String mountainKey, void onData(String name)) async {
    String accountKey = await _getAccountKey();

    StreamSubscription<Event> subscription = FirebaseDatabase.instance
        .reference()
        .child("sensors")
        .child(accountKey)
        .child("readsensors")
        .child(mountainKey)
        .child("humidity")
        .onValue
        .listen((Event event) {
      String name = event.snapshot.value as String;
      if (name == null) {
        name = "";
      }
      onData(name);
    });

    return subscription;
  }

  static Future<StreamSubscription<Event>> getValueLDRStream(
      String mountainKey, void onData(String name)) async {
    String accountKey = await _getAccountKey();

    StreamSubscription<Event> subscription = FirebaseDatabase.instance
        .reference()
        .child("sensors")
        .child(accountKey)
        .child("readsensors")
        .child(mountainKey)
        .child("LDR")
        .onValue
        .listen((Event event) {
      String name = event.snapshot.value as String;
      if (name == null) {
        name = "";
      }
      onData(name);
    });

    return subscription;
  }

  static Future<StreamSubscription<Event>> getMotorValue(
      String mountainKey, void onData(String name)) async {
    String accountKey = await _getAccountKey();

    StreamSubscription<Event> subscription = FirebaseDatabase.instance
        .reference()
        .child("sensors")
        .child(accountKey)
        .child("readsensors")
        .child(mountainKey)
        .child("motor")
        .onValue
        .listen((Event event) {
      String name = event.snapshot.value as String;
      if (name == null) {
        name = "";
      }
      onData(name);
    });

    return subscription;
  }

  static Future<void> savePhysicsName(String mountainKey, String name) async {
    String accountKey = await _getAccountKey();

    return FirebaseDatabase.instance
        .reference()
        .child("physics")
        .child(accountKey)
        .child("readsensors")
        .child(mountainKey)
        .child('name')
        .set(name);
  }

  static Future<void> savePhysicsValueTemp(
      String mountainKey, String valueTemp) async {
    String accountKey = await _getAccountKey();
    String val;
    if (valueTemp != null) {
      val = valueTemp;
    } else {
      val = ' ';
    }

    return FirebaseDatabase.instance
        .reference()
        .child("physics")
        .child(accountKey)
        .child("readsensors")
        .child(mountainKey)
        .child('value')
        .set(val);
  }

  static Future<void> savePhysicsValueHumidity(
      String mountainKey, String valueHumidity) async {
    String accountKey = await _getAccountKey();
    String val;
    if (valueHumidity != null) {
      val = valueHumidity;
    } else {
      val = ' ';
    }

    return FirebaseDatabase.instance
        .reference()
        .child("physics")
        .child(accountKey)
        .child("readsensors")
        .child(mountainKey)
        .child('humidity')
        .set(val);
  }

  static Future<void> savePhysicsValueLDR(
      String mountainKey, String valueLDR) async {
    String accountKey = await _getAccountKey();
    String val;
    if (valueLDR != null) {
      val = valueLDR;
    } else {
      val = ' ';
    }
    return FirebaseDatabase.instance
        .reference()
        .child("physics")
        .child(accountKey)
        .child("readsensors")
        .child(mountainKey)
        .child('LDR')
        .set(val);
  }

  static Future<void> savePhysicsValueMotor(
      String mountainKey, String motor) async {
    String accountKey = await _getAccountKey();
    String val;
    if (motor != null) {
      val = motor;
    } else {
      val = ' ';
    }
    return FirebaseDatabase.instance
        .reference()
        .child("physics")
        .child(accountKey)
        .child("readsensors")
        .child(mountainKey)
        .child('motor')
        .set(val);
  }

  static Future<StreamSubscription<Event>> getPhysicsNameStream(
      String mountainKey, void onData(String name)) async {
    String accountKey = await _getAccountKey();

    StreamSubscription<Event> subscription = FirebaseDatabase.instance
        .reference()
        .child("physics")
        .child(accountKey)
        .child("readsensors")
        .child(mountainKey)
        .child("name")
        .onValue
        .listen((Event event) {
      String name = event.snapshot.value as String;
      if (name == null) {
        name = "";
      }
      onData(name);
    });

    return subscription;
  }

  static Future<StreamSubscription<Event>> getPhysicsValueStream(
      String mountainKey, void onData(String name)) async {
    String accountKey = await _getAccountKey();

    StreamSubscription<Event> subscription = FirebaseDatabase.instance
        .reference()
        .child("physics")
        .child(accountKey)
        .child("readsensors")
        .child(mountainKey)
        .child("value")
        .onValue
        .listen((Event event) {
      String name = event.snapshot.value as String;
      if (name == null) {
        name = "";
      }
      onData(name);
    });

    return subscription;
  }

  static Future<StreamSubscription<Event>> getPhysicsValueHumidityStream(
      String mountainKey, void onData(String name)) async {
    String accountKey = await _getAccountKey();

    StreamSubscription<Event> subscription = FirebaseDatabase.instance
        .reference()
        .child("physics")
        .child(accountKey)
        .child("readsensors")
        .child(mountainKey)
        .child("humidity")
        .onValue
        .listen((Event event) {
      String name = event.snapshot.value as String;
      if (name == null) {
        name = "";
      }
      onData(name);
    });

    return subscription;
  }

  static Future<StreamSubscription<Event>> getPhysicsValueLDRStream(
      String mountainKey, void onData(String name)) async {
    String accountKey = await _getAccountKey();

    StreamSubscription<Event> subscription = FirebaseDatabase.instance
        .reference()
        .child("physics")
        .child(accountKey)
        .child("readsensors")
        .child(mountainKey)
        .child("LDR")
        .onValue
        .listen((Event event) {
      String name = event.snapshot.value as String;
      if (name == null) {
        name = "";
      }
      onData(name);
    });

    return subscription;
  }

  static Future<StreamSubscription<Event>> getPhysicsMotorValue(
      String mountainKey, void onData(String name)) async {
    String accountKey = await _getAccountKey();

    StreamSubscription<Event> subscription = FirebaseDatabase.instance
        .reference()
        .child("physics")
        .child(accountKey)
        .child("readsensors")
        .child(mountainKey)
        .child("motor")
        .onValue
        .listen((Event event) {
      String name = event.snapshot.value as String;
      if (name == null) {
        name = "";
      }
      onData(name);
    });

    return subscription;
  }

  static Future<Query> queryElectronics() async {
    String accountKey = await _getAccountKey();

    return FirebaseDatabase.instance
        .reference()
        .child("sensors")
        .child(accountKey)
        .child("readsensors")
        .orderByChild("name");
  }

  static Future<Query> queryPhysics() async {
    String accountKey = await _getAccountKey();

    return FirebaseDatabase.instance
        .reference()
        .child("physics")
        .child(accountKey)
        .child("readsensors")
        .orderByChild("name");
  }
}

Future<String> _getAccountKey() async {
  return '12345678';
}

/// requires: intl: ^0.15.2
