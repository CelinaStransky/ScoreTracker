import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:numberpicker/numberpicker.dart';
import 'language_settings.dart';
import 'simple_Widgets.dart';
import 'simple_functions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void setMainColor(Color color) async {
    setState(
      () {
        mainColor = color;
      },
    );
  }

  // This widget is the root of your application.
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
      home: MyHomePage(title: 'Score Tracker', setMainColor: setMainColor),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage(
      {super.key, required this.title, required this.setMainColor});
  final String title;
  final Function setMainColor; // Accept the function as a parameter

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
        child: currentIndex == 0
            ? layoutVertical == true
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: TeamAName(),
                                ),
                                TeamACounter(),
                                Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: PlusButton(
                                        Size(120, 80), incrementCounterA)),
                                Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: MinusButton(
                                        Size(40, 40), decrementCounterA)),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: TeamBName(),
                                ),
                                TeamBCounter(),
                                Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: PlusButton(
                                        Size(120, 80), incrementCounterB)),
                                Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: MinusButton(
                                        Size(40, 40), decrementCounterB)),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: resetButton(Size(150, 50), reset),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: TeamsButton(Size(200, 50), () {
                          if (themeColor != mainColor) {
                            widget.setMainColor(themeColor);
                          }
                        }),
                      ),
                    ],
                  )
                : RotatedBox(
                    quarterTurns: 1,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Column(
                                  children: [
                                    TeamAName(),
                                    TeamACounter(),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Column(
                                  children: [
                                    TeamBName(),
                                    TeamBCounter(),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: PlusButton(
                                          Size(150, 100), incrementCounterA)),
                                  Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: MinusButton(
                                          Size(40, 40), decrementCounterA)),
                                ],
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(30.0),
                                  child: resetButton(Size(100, 100), reset),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: TeamsButton(Size(100, 50), () {
                                    if (themeColor != mainColor) {
                                      widget.setMainColor(themeColor);
                                    }
                                  }),
                                ),
                              ],
                            ),
                            Expanded(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: PlusButton(
                                      Size(150, 100), incrementCounterB),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: MinusButton(
                                      Size(40, 40), decrementCounterB),
                                ),
                              ],
                            )),
                          ],
                        ),
                      ],
                    ),
                  )
            : Scaffold(
                body: LayoutBuilder(
                  builder: (context, constraints) {
                    return ListView(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () => showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: Text(languageMap['teamNames']?[currLang]),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text('Team A'),
                                  TextField(
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.people),
                                    ),
                                    onChanged: (String value) async {
                                      setState(
                                        () {
                                          if (value.length > 20) {
                                            teamA = value.substring(0, 19);
                                          } else
                                            teamA = value;
                                        },
                                      );
                                    },
                                  ),
                                  Text('Team B'),
                                  TextField(
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.people),
                                    ),
                                    onChanged: (String value) async {
                                      setState(() {
                                        if (value.length > 20) {
                                          teamB = value.substring(0, 19);
                                        } else
                                          teamB = value;
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
                                  style: TextStyle(fontSize: 40),
                                ),
                              ),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () => showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title:
                                  Text(languageMap['colorScheme']?[currLang]),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ColorPicker(
                                    pickerColor: mainColor,
                                    onColorChanged: (color) => setState(() {
                                      mainColor = color;
                                      themeColor = color;
                                      widget.setMainColor(color);
                                    }),
                                    enableAlpha: false,
                                    showLabel: false,
                                  ),
                                  TextButton(
                                    child:
                                        Text(languageMap['select']?[currLang]),
                                    onPressed: () =>
                                        Navigator.of(context).pop(),
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
                                  style: TextStyle(fontSize: 40),
                                ),
                              ),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () => showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: Text(languageMap['language']?[currLang]),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  RadioListTile(
                                    title: Text('English'),
                                    value: en,
                                    groupValue: currLang,
                                    onChanged: (value) {
                                      setState(() {
                                        Navigator.pop(context);
                                        currLang = value!;
                                      });
                                    },
                                  ),
                                  RadioListTile(
                                    title: Text('Deutsch'),
                                    value: de,
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
                                    style: TextStyle(fontSize: 40)),
                              ),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () => showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title:
                                  Text(languageMap['switchTeams']?[currLang]),
                              content: StatefulBuilder(
                                builder: (BuildContext context,
                                    StateSetter setState) {
                                  return Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(languageMap[
                                                        'switchTeamsAlert']
                                                    ?[currLang]),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Switch(
                                                    activeColor: mainColor,
                                                    value: teamSwitchEnabled,
                                                    onChanged: (value) {
                                                      setState(() {
                                                        teamSwitchEnabled =
                                                            value;
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
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(languageMap[
                                                        'switchTeamAfter']
                                                    ?[currLang])
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                NumberPicker(
                                                    minValue: 0,
                                                    maxValue: 100,
                                                    value: changeAfter,
                                                    onChanged: (value) {
                                                      setState(() {
                                                        changeAfter = value;
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
                                                title: Text(languageMap['hint']
                                                    ?[currLang]),
                                                content: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Text(languageMap[
                                                            'explanationTeamSwitch']
                                                        ?[currLang])
                                                  ],
                                                ),
                                              ),
                                            ),
                                            child: Text(
                                                languageMap['hint']?[currLang]),
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
                                        style: TextStyle(fontSize: 40)),
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
              ),
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
