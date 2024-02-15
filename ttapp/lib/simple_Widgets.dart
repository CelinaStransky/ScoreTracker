import 'package:flutter/material.dart';
import 'language_settings.dart';
import 'global_functions.dart';
import 'global_variables.dart';

Widget teamAName() {
  return Text(
    teamA,
    style: const TextStyle(
      fontSize: 25,
    ),
  );
}

Widget teamBName() {
  return Text(
    teamB,
    style: const TextStyle(
      fontSize: 25,
    ),
  );
}

Widget teamACounter() {
  return Text(
    '$counterA',
    style: const TextStyle(
      fontSize: 30,
    ),
  );
}

Widget teamBCounter() {
  return Text(
    '$counterB',
    style: const TextStyle(
      fontSize: 30,
    ),
  );
}

Widget plusButton(Size size, VoidCallback onPressed) {
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
        color: const Color.fromARGB(255, 14, 97, 14),
        fontSize: size.height,
      ),
    ),
  );
}

Widget minusButton(Size size, VoidCallback onPressed) {
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
        color: const Color.fromARGB(255, 133, 8, 33),
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

Widget teamSwitchButton(Size size, VoidCallback onPressed) {
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
