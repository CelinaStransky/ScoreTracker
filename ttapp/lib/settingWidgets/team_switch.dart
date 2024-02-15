import 'package:flutter/material.dart';
import '/language_settings.dart';
import '/global_variables.dart' as global;
import 'package:numberpicker/numberpicker.dart';


class TeamSwitchButton extends StatefulWidget {
  const TeamSwitchButton({super.key});

  @override
  TeamSwitchButtonState createState() => TeamSwitchButtonState();
}

class TeamSwitchButtonState extends State<TeamSwitchButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
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
                            Text(languageMap['switchTeamsAlert']?[currLang]),
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
                            Text(languageMap['switchTeamAfter']?[currLang])
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
                          builder: (BuildContext context) => AlertDialog(
                            title: Text(languageMap['hint']?[currLang]),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(languageMap['explanationTeamSwitch']
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
    );
  }
}
