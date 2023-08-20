import 'package:flutter/material.dart';

Color mainColor = Color.fromARGB(255, 205, 175, 225);

int counterA = 0;
int counterB = 0;
int currentIndex = 0;

String teamA = 'Team A';
String teamB = 'Team B';

Color pickerColor = Color.fromARGB(255, 129, 115, 136);
Color currentColor = Color(0xff443a49);

bool layoutVertical = true;

String lang = 'en';

Color darker(Color color) {
  var r = (color.red * 0.3).round();
  var g = (color.green * 0.3).round();
  var b = (color.blue * 0.3).round();
  return Color.fromARGB(255, r, g, b);
}

Color lighter(Color color) {
  var r = ((255 - color.red) * 0.7).round() + color.red;
  if (r > 255) r = 255;
  var g = ((255 - color.green) * 0.7).round() + color.green;
  if (g > 255) g = 255;
  var b = ((255 - color.blue) * 0.7).round() + color.blue;
  if (b > 255) b = 255;
  return Color.fromARGB(color.alpha, r, g, b);
}

Color verylight(Color color) {
  var r = ((255 - color.red) * 0.9).round() + color.red;
  if (r > 255) r = 255;
  var g = ((255 - color.green) * 0.9).round() + color.green;
  if (g > 255) g = 255;
  var b = ((255 - color.blue) * 0.9).round() + color.blue;
  if (b > 255) b = 255;
  return Color.fromARGB(color.alpha, r, g, b);
}
