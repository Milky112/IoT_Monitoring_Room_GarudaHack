import 'package:flutter/material.dart';

class roundedButton extends StatelessWidget {
  roundedButton(
      {this.color,
      this.title,
      @required this.onPress,
      this.height,
      this.width});
  final Color color;
  final String title;
  final Function onPress;
  final double height, width;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: color,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onPress,
          minWidth: width,
          height: height,
          child: Text(
            '$title',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
            ),
          ),
        ),
      ),
    );
  }
}
