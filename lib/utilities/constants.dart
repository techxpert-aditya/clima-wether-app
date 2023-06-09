import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(
  fontSize: 70.0,
  fontWeight: FontWeight.w500,
);

const kMessageTextStyle = TextStyle(
  fontSize: 40.0,
  fontWeight: FontWeight.w100,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  color: Colors.white,
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
        100,
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
