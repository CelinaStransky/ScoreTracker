import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
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

  void changeColor(Color color) {
    setState(() => pickerColor = color);
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
            lang == 'en' ? appBarTitleEN : appBarTitleDE,
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
                                TeamAName(),
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
                                TeamBName(),
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
                              title: const Text('Team Names'),
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
                                          teamA = value;
                                        },
                                      );
                                    },
                                  ),
                                  Text('Team B'),
                                  TextField(
                                    decoration: InputDecoration(
                                        prefixIcon: Icon(Icons.people)),
                                    onChanged: (String value) async {
                                      setState(() {
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
                                  lang == 'en' ? TeamnamesEN : TeamNamesDE,
                                  style: TextStyle(fontSize: 40),
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: Text(
                                  lang == 'en' ? ColorSchemeEN : ColorSchemeDE),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ColorPicker(
                                    pickerColor: mainColor,
                                    onColorChanged: (color) => setState(() {
                                      changeColor(color);
                                      mainColor = color;
                                      widget.setMainColor(color);
                                    }),
                                    enableAlpha: false,
                                    showLabel: false,
                                  ),
                                  TextButton(
                                    child: Text(
                                        lang == 'en' ? selectEN : selectDE),
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
                                  lang == 'en' ? ColorSchemeEN : ColorSchemeDE,
                                  style: TextStyle(fontSize: 40),
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title:
                                  Text(lang == 'en' ? LanguageEN : LanguageDE),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  RadioListTile(
                                    title: Text(
                                        lang == 'en' ? EnglishEN : EnglishDE),
                                    value: 'en',
                                    groupValue: lang,
                                    onChanged: (value) {
                                      setState(() {
                                        Navigator.pop(context);
                                        lang = value!;
                                      });
                                    },
                                  ),
                                  RadioListTile(
                                    title: Text(
                                        lang == 'en' ? GermanEN : GermanDE),
                                    value: 'de',
                                    groupValue: lang,
                                    onChanged: (value) {
                                      setState(() {
                                        Navigator.pop(context);
                                        lang = value!;
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
                                child: lang == 'en'
                                    ? Text(
                                        LanguageEN,
                                        style: TextStyle(fontSize: 40),
                                      )
                                    : Text(
                                        LanguageDE,
                                        style: TextStyle(fontSize: 40),
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
            label: lang == 'en' ? homeEN : homeDE,
            icon: Icon(Icons.home_filled),
          ),
          BottomNavigationBarItem(
            label: lang == 'en' ? settingsEN : settingsDE,
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
