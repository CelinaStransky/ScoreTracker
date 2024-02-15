import 'package:flutter/material.dart';

import 'package:ttapp/settingWidgets/color_scheme.dart';
import 'package:ttapp/settingWidgets/language.dart';
import 'package:ttapp/settingWidgets/team_names.dart';
import 'package:ttapp/settingWidgets/team_switch.dart';
import 'language_settings.dart';
import 'global_variables.dart' as global;

class SettingsPage extends StatefulWidget {
  final Function(Color) setMainColor;
  final int currentLanguage;

  SettingsPage(
      {required mainColor,
      required this.setMainColor,
      required this.currentLanguage});

  @override
  SettingsPageState createState() => SettingsPageState();
}

class SettingsPageState extends State<SettingsPage> {
  int currentLanguage = 0; // Manage the language state here

  @override
  void initState() {
    super.initState();
    currentLanguage = currLang; // Initialize the language state
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return ListView(
            children: <Widget>[
              // ----------------------CHANGE TEAM NAMES------------------------
              TeamNamesButton(),
              //---------------------- COLOR SCHEME-----------------------------
              ColorSchemeButton(
                  mainColor: global.mainColor,
                  setMainColor: widget.setMainColor),
              // ----------------------LANGUAGE---------------------------------
              LanguageButton(currentLanguage: currentLanguage),
              // ------------------------TEAM SWITCH EN-/DISABLE----------------
              TeamSwitchButton(),
            ],
          );
        },
      ),
    );
  }
}
