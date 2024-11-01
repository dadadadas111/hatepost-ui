import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';

DateTime? getExpiredTokenTime() {
  // make a function that return the datetime of now + 1 hour 30 mins
  DateTime now = DateTime.now();
  DateTime newDateTime = now.add(Duration(hours: 1, minutes: 30));
  return newDateTime;
}

bool getValidPassword(String input) {
  // count the number of characters in a string
  return input.length >= 8;
}
