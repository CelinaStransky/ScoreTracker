import 'package:flutter/material.dart';
//import 'package:shared_preferences/shared_preferences.dart';
import 'package:ttapp/settings_page.dart';

import 'language_settings.dart';
import 'simple_Widgets.dart';
import 'global_functions.dart';
import 'global_variables.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Color mainColor;

  @override
  void initState() {
    super.initState();
    mainColor = Color.fromARGB(255, 205, 175, 225);
  }

  void setMainColor(Color color) async {
    setState(
      () {
        mainColor = color;
      },
    );
  }

  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ttapp',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: mainColor),
        useMaterial3: true,
        fontFamily: 'Monserrat',
      ),
      home: MyHomePage(
          title: 'Score Tracker',
          mainColor: mainColor,
          setMainColor: setMainColor),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key? key,
    required this.title,
    required this.mainColor,
    required this.setMainColor,
  }) : super(key: key);

  final String title;
  final Color mainColor;
  final Function(Color) setMainColor;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void incrementCounterA() {
    setState(
      () {
        counterA++;
        if (teamSwitchEnabled && (counterA + counterB) % changeAfter == 0) {
          widget.setMainColor(inverse(mainColor));
        }
      },
    );
  }

  void decrementCounterA() {
    setState(
      () {
        if (counterA == 0) return;
        counterA--;
      },
    );
  }

  void incrementCounterB() {
    setState(
      () {
        counterB++;
        if (teamSwitchEnabled && (counterA + counterB) % changeAfter == 0) {
          widget.setMainColor(inverse(mainColor));
        }
      },
    );
  }

  void decrementCounterB() {
    setState(
      () {
        if (counterB == 0) return;
        counterB--;
      },
    );
  }

  void reset() {
    setState(
      () {
        counterB = 0;
        counterA = 0;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lighter(mainColor),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          centerTitle: true,
          backgroundColor: mainColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          title: Text(
            languageMap['appBarTitle']?[currLang],
            style: TextStyle(
              fontSize: 40,
            ),
          ),
        ),
      ),
      body: Container(
        //  Current page: Home / Team Scores page
        child: currentIndex == 0

            // Layout of the main page vertical
            ? layoutVertical == true
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          // Left column, for team A
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: teamAName(),
                                ),
                                teamACounter(),
                                Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: plusButton(
                                        Size(120, 80), incrementCounterA)),
                                Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: minusButton(
                                        Size(40, 40), decrementCounterA)),
                              ],
                            ),
                          ),

                          // Right column, for team B
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: teamBName(),
                                ),
                                teamBCounter(),
                                Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: plusButton(
                                        Size(120, 80), incrementCounterB)),
                                Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: minusButton(
                                        Size(40, 40), decrementCounterB)),
                              ],
                            ),
                          ),
                        ],
                      ),

                      // Reset button
                      Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: resetButton(Size(150, 50), reset),
                      ),

                      // Button for the team switch hint
                      // Is hidden, when teamSwitch is disabled
                      Visibility(
                        visible: teamSwitchEnabled,
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: teamSwitchButton(Size(200, 50), () {
                            if (themeColor != mainColor) {
                              widget.setMainColor(themeColor);
                            }
                          }),
                        ),
                      ),
                    ],
                  )

                // Otherwise: Layout Horozontal, not the default
                : RotatedBox(
                    quarterTurns: 1,
                    child: Column(
                      children: [
                        // Team names and counters
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Column(
                                  children: [
                                    teamAName(),
                                    teamACounter(),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Column(
                                  children: [
                                    teamBName(),
                                    teamBCounter(),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),

                        // Buttons for increment and decrement
                        Row(
                          children: [
                            // TEAM A
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: plusButton(
                                          Size(150, 100), incrementCounterA)),
                                  Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: minusButton(
                                          Size(40, 40), decrementCounterA)),
                                ],
                              ),
                            ),

                            // RESET AND TEAMSWITCH
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(30.0),
                                  child: resetButton(Size(100, 100), reset),
                                ),
                                Visibility(
                                  visible: teamSwitchEnabled,
                                  child: Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: teamSwitchButton(Size(100, 50), () {
                                      if (themeColor != mainColor) {
                                        widget.setMainColor(themeColor);
                                      }
                                    }),
                                  ),
                                ),
                              ],
                            ),

                            // TEAM B
                            Expanded(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: plusButton(
                                      Size(150, 100), incrementCounterB),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: minusButton(
                                      Size(40, 40), decrementCounterB),
                                ),
                              ],
                            )),
                          ],
                        ),
                      ],
                    ),
                  )

            // Settings page
            : SettingsPage(
                mainColor: widget.mainColor, setMainColor: widget.setMainColor),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            label: languageMap['home']?[currLang],
            icon: Icon(Icons.home_filled),
          ),
          BottomNavigationBarItem(
            label: languageMap['settings']?[currLang],
            icon: Icon(Icons.settings),
          ),
        ],
        currentIndex: currentIndex,
        onTap: (int index) {
          setState(
            () {
              currentIndex = index;
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              layoutVertical = !layoutVertical;
            });
          },
          tooltip: 'Layout',
          child: const Icon(Icons.layers_outlined)),
    );
  }
}
