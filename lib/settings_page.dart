import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_dropdown_alert/alert_controller.dart';
import 'package:flutter_dropdown_alert/model/data_alert.dart';
import 'package:provider/provider.dart';
import 'models/color_theme_data.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Choose Theme',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      backgroundColor: Provider.of<ColorThemeData>(context).isRed == true
          ? Colors.redAccent
          : Colors.teal,
      body: Card(
        child: SwitchListTile(
          title: Provider.of<ColorThemeData>(context).isRed == true
              ? Text(
                  'Red Theme',
                  style: TextStyle(
                      color: Colors.redAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                )
              : Text('Teal Theme',
                  style: TextStyle(
                      color: Colors.teal,
                      fontWeight: FontWeight.bold,
                      fontSize: 18)),
          value: Provider.of<ColorThemeData>(context).isRed,
          onChanged: (_) {
            Provider.of<ColorThemeData>(context, listen: false).toggleTheme();
            AlertController.show(
                'Change Theme', 'You changed Theme', TypeAlert.success);
          },
        ),
      ),
    );
  }
}
