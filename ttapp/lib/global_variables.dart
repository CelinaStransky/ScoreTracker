import 'package:flutter/material.dart';


// main color, either default, or set by user in setting
Color mainColor = Color.fromARGB(255, 205, 175, 225);
// used for signaling that team switch should be made
Color themeColor = Color.fromARGB(255, 205, 175, 225);

int counterA = 0;
int counterB = 0;
int currentIndex = 0;

String teamA = 'Team A';
String teamB = 'Team B';

Color pickerColor = Color.fromARGB(255, 129, 115, 136);
Color currentColor = Color(0xff443a49);

bool layoutVertical = true;

int language = 0;
int en = 0;
int de = 1;

bool teamSwitchEnabled = true;
int changeAfter = 5;