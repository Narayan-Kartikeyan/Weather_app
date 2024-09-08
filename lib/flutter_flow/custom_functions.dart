import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/supabase/supabase.dart';

List<String> newCustomFunction() {
  return [
    "12:00 AM",
    "1:00 AM",
    "2:00 AM",
    "3:00 AM",
    "4:00 AM",
    "5:00 AM",
    "6:00 AM",
    "7:00 AM",
    "8:00 AM",
    "9:00 AM",
    "10:00 AM",
    "11:00 AM",
    "12:00 PM",
    "1:00 PM",
    "2:00 PM",
    "3:00 PM",
    "4:00 PM",
    "5:00 PM",
    "6:00 PM",
    "7:00 PM",
    "8:00 PM",
    "9:00 PM",
    "10:00 PM",
    "11:00 PM"
  ];
}

String getIcon(String condition) {
  DateTime now = DateTime.now();

  if (condition.contains("rain") || condition.contains("drizzle")) {
    return "rainy";
  } else if (condition.contains("thunder")) {
    return "thunder";
  } else if (condition.contains("Cloudy") || condition.contains("cloudy")) {
    return "cloudy";
  } else if (condition.contains("clear") && (now.hour > 7 || now.hour < 18) ||
      condition.contains("sunny")) {
    return "sunny";
  } else if (condition.contains("clear") && (now.hour < 7 || now.hour > 18)) {
    return "night";
  } else if (condition.contains("overcast")) {
    return "overcast";
  }
  return "";
}

int returntemp() {
  var now = DateTime.now();
  var hour = now.hour;
  return hour;
}

int floor(String? temperature) {
  if (temperature == null) {
    return 28;
  }
  return int.parse(temperature.split('.')[0]);
}
