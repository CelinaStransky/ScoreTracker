import 'package:flutter/material.dart';
import '/language_settings.dart';
import '/global_variables.dart' as global;

class TeamNamesButton extends StatefulWidget {
  const TeamNamesButton({super.key});

  @override
  TeamNamesButtonState createState() => TeamNamesButtonState();
}

class TeamNamesButtonState extends State<TeamNamesButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => showDialog<String>(
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
    );
  }
}
