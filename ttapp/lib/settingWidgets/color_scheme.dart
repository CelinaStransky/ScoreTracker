import 'package:flutter/material.dart';
import '/language_settings.dart';
import '/global_variables.dart' as global;
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class ColorSchemeButton extends StatefulWidget {
  final Function(Color) setMainColor;

  const ColorSchemeButton(
      {super.key, required mainColor, required this.setMainColor});

  @override
  ColorSchemeButtonState createState() => ColorSchemeButtonState();
}

class ColorSchemeButtonState extends State<ColorSchemeButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text(languageMap['colorScheme']?[currLang]),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ColorPicker(
                pickerColor: global.mainColor,
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
    );
  }
}
