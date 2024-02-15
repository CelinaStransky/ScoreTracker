import 'package:flutter/material.dart';
import 'language_settings.dart';
import 'global_variables.dart' as global;
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:numberpicker/numberpicker.dart';

class SettingsPage extends StatefulWidget {
  //final Color mainColor;
  final Function(Color) setMainColor;

  const SettingsPage({required mainColor, required this.setMainColor});


  @override
  SettingsPageState createState() => SettingsPageState();
}

class SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return ListView(
            children: <Widget>[

              // ----------------------CHANGE TEAM NAMES----------------------------
              GestureDetector(
                onTap: () => showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: Text(languageMap['teamNames']?[currLang]),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text('Team A'),
                        TextField(
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.people),
                            ),
                          onChanged: (String value) async {
                            setState(
                              () {
                                if (value.length > 20) {
                                  global.teamA = value.substring(0, 19);
                                } else {
                                  global.teamA = value;
                                }
                              },
                            );
                          },
                        ),
                        const Text('Team B'),
                        TextField(
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.people),
                          ),
                          onChanged: (String value) async {
                            setState(() {
                              if (value.length > 20) {
                                global.teamB = value.substring(0, 19);
                              } else { 
                                global.teamB = value;
                              }
                            });
                          },
                        ),
                      ],
                    ),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'OK'),
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                ),
                child: Card(
                  elevation: 20,
                  child: SizedBox(
                    height: 100,
                    child: Center(
                      child: Text(
                        languageMap['teamNames']?[currLang],
                        style: const TextStyle(fontSize: 40),
                      ),
                    ),
                  ),
                ),
              ),

              //---------------------- COLOR SCHEME-----------------------------------------
              TextButton(
                onPressed: () => showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: Text(languageMap['colorScheme']?[currLang]),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ColorPicker(
                          pickerColor:global.mainColor,
                          onColorChanged: (color) => setState(() {
                            global.mainColor = color;
                            global.themeColor = color;
                            widget.setMainColor(color);
                          }),
                          enableAlpha: false,
                          labelTypes: const [],
                        ),
                        TextButton(
                          child: Text(languageMap['select']?[currLang]),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                      ],
                    ),
                  ),
                ),
                child: Card(
                  elevation: 20,
                  child: SizedBox(
                    height: 100,
                    child: Center(
                      child: Text(
                        languageMap['colorScheme']?[currLang],
                        style: const TextStyle(fontSize: 40),
                      ),
                    ),
                  ),
                ),
              ),

              // ----------------------LANGUAGE---------------------------------
              TextButton(
                onPressed: () => showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: Text(languageMap['language']?[currLang]),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        RadioListTile(
                          title: const Text('English'),
                          value: global.en,
                          groupValue: currLang,
                          onChanged: (value) {
                            setState(() {
                              Navigator.pop(context);
                              currLang = value!;
                            });
                          },
                        ),
                        RadioListTile(
                          title: const Text('Deutsch'),
                          value: global.de,
                          groupValue: currLang,
                          onChanged: (value) {
                            setState(() {
                              Navigator.pop(context);
                              currLang = value!;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                child: Card(
                  elevation: 20,
                  child: SizedBox(
                    height: 100,
                    child: Center(
                      child: Text(languageMap['language']?[currLang],
                          style: const TextStyle(fontSize: 40)),
                    ),
                  ),
                ),
              ),

              // ------------------------TEAM SWITCH EN-/DISABLE-----------------
              TextButton(
                onPressed: () => showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: Text(languageMap['switchTeams']?[currLang]),
                    content: StatefulBuilder(
                      builder: (BuildContext context, StateSetter setState) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(languageMap['switchTeamsAlert']
                                          ?[currLang]),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Switch(
                                          activeColor: global.mainColor,
                                          value: global.teamSwitchEnabled,
                                          onChanged: (value) {
                                            setState(() {
                                              global.teamSwitchEnabled = value;
                                            });
                                          }),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(languageMap['switchTeamAfter']
                                          ?[currLang])
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      NumberPicker(
                                          minValue: 1,
                                          maxValue: 100,
                                          value: global.changeAfter,
                                          onChanged: (value) {
                                            setState(() {
                                              global.changeAfter = value;
                                            });
                                          }),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                TextButton(
                                  onPressed: () => showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                      title:
                                          Text(languageMap['hint']?[currLang]),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(languageMap[
                                                  'explanationTeamSwitch']
                                              ?[currLang])
                                        ],
                                      ),
                                    ),
                                  ),
                                  child: Text(languageMap['hint']?[currLang]),
                                )
                              ],
                            )
                          ],
                        );
                      },
                    ),
                  ),
                ),
                child: Card(
                  elevation: 20,
                  child: SizedBox(
                    height: 100,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(languageMap['switchTeams']?[currLang],
                              style: const TextStyle(fontSize: 40)),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
