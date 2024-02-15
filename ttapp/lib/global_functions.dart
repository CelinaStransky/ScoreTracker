import 'package:flutter/material.dart';

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

Color inverse(Color color) {
  return Color.fromARGB(
      color.alpha, 255 - color.red, 255 - color.green, 255 - color.blue);
}
