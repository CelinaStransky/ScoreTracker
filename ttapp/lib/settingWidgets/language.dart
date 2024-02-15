import 'package:flutter/material.dart';
import 'package:ttapp/main.dart';
import '/language_settings.dart' as lang;
import '/global_variables.dart' as global;

class LanguageButton extends StatefulWidget {
  final int currentLanguage;
  LanguageButton({super.key, required this.currentLanguage});

  @override
  LanguageButtonState createState() => LanguageButtonState();
}

class LanguageButtonState extends State<LanguageButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text(lang.languageMap['language']?[lang.currLang]),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RadioListTile(
                title: const Text('English'),
                value: lang.en,
                groupValue: lang.currLang,
                onChanged: (value) {
                  setState(() {
                    //Navigator.pop(context);
                    lang.currLang = value!;

                    /// TODO: Implement State Management so that this is not needed anymore
                    Navigator.pushReplacement(
                      context,

                      // this prevents a weird animation when the replacement is pushed
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            MyApp(),
                        transitionDuration: Duration(seconds: 0),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          return child;
                        },
                      ),
                    );
                  });
                },
              ),
              RadioListTile(
                title: const Text('Deutsch'),
                value: lang.de,
                groupValue: lang.currLang,
                onChanged: (value) {
                  setState(() {
                    //Navigator.pop(context);
                    lang.currLang = value!;

                    /// TODO: Implement State Management so that this is not needed anymore
                    Navigator.pushReplacement(
                      context,
                      // this prevents a weird animation when the replacement is pushed
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            MyApp(),
                        transitionDuration: Duration(seconds: 0),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          return child;
                        },
                      ),
                    );
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
            child: Text(lang.languageMap['language']?[lang.currLang],
                style: const TextStyle(fontSize: 40)),
          ),
        ),
      ),
    );
  }
}
