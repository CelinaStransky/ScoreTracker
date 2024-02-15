import 'package:flutter/material.dart';


// current main color of the application, is inversed, when user has teamswitch enabled, and points are met
Color mainColor = Color.fromARGB(255, 205, 175, 225);

// color of the user theme, only changed, when user changes it in the settings
Color themeColor = Color.fromARGB(255, 205, 175, 225);

int counterA = 0;
int counterB = 0;
int currentIndex = 0;

String teamA = 'Team A';
String teamB = 'Team B';

bool layoutVertical = true;

bool teamSwitchEnabled = true;
int changeAfter = 5;