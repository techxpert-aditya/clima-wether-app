import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(
  fontSize: 100.0,
);

const kMessageTextStyle = TextStyle(
  fontSize: 70.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 50.0,
);

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);

const ktextFieldDecorationStyle = InputDecoration(
  hintText: 'Enter City Name',
  hintStyle: TextStyle(
    color: Colors.grey,
  ),
  filled: true,
  fillColor: Colors.white,
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(
        10,
      ),
    ),
    borderSide: BorderSide.none,
  ),
  icon: Icon(
    Icons.location_city,
    color: Colors.white,
    size: 30,
  ),
);
