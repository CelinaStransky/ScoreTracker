import 'package:flutter/material.dart';
import 'language_settings.dart';
import 'global_functions.dart';
import 'global_variables.dart';

Widget TeamAName() {
  return Text(
    teamA,
    style: TextStyle(
      fontSize: 25,
    ),
  );
}

Widget TeamBName() {
  return Text(
    teamB,
    style: TextStyle(
      fontSize: 25,
    ),
  );
}

Widget TeamACounter() {
  return Text(
    '$counterA',
    style: TextStyle(
      fontSize: 30,
    ),
  );
}

Widget TeamBCounter() {
  return Text(
    '$counterB',
    style: TextStyle(
      fontSize: 30,
    ),
  );
}

Widget PlusButton(Size size, VoidCallback onPressed) {
  return FilledButton(
    style: FilledButton.styleFrom(
      minimumSize: size,
      backgroundColor: const Color.fromARGB(255, 133, 222, 110),
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
    onPressed: onPressed,
    child: Text(
      '+',
      style: TextStyle(
        color: Color.fromARGB(255, 14, 97, 14),
        fontSize: size.height,
      ),
    ),
  );
}

Widget MinusButton(Size size, VoidCallback onPressed) {
  return FilledButton(
    style: FilledButton.styleFrom(
      minimumSize: size,
      backgroundColor: const Color.fromARGB(255, 225, 105, 105),
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
    onPressed: onPressed,
    child: Text(
      '-',
      style: TextStyle(
        color: Color.fromARGB(255, 133, 8, 33),
        fontSize: size.height,
      ),
    ),
  );
}

Widget resetButton(Size size, VoidCallback onPressed) {
  return FilledButton(
    style: FilledButton.styleFrom(
      minimumSize: size,
      backgroundColor: darker(mainColor),
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
    onPressed: onPressed,
    child: Text(
      languageMap['reset']?[currLang],
      style: TextStyle(
        color: verylight(mainColor),
        fontSize: 20,
      ),
    ),
  );
}

Widget TeamSwitchButton(Size size, VoidCallback onPressed) {
  return FilledButton(
    style: FilledButton.styleFrom(
      minimumSize: size,
      backgroundColor: mainColor,
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
    onPressed: onPressed,
    child: Text(
      languageMap['switchCompleted']?[currLang],
      style: TextStyle(
        color: verylight(mainColor),
        fontSize: 20,
      ),
    ),
  );
}
