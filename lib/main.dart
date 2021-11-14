import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/items_data.dart';
import 'package:flutter_dropdown_alert/dropdown_alert.dart';
import 'models/color_theme_data.dart';
import 'screens/home_page.dart';

void main() => runApp(MultiProvider(providers: [
      ChangeNotifierProvider<ItemData>(
          create: (BuildContext context) => ItemData()),
      ChangeNotifierProvider<ColorThemeData>(
        create: (BuildContext context) => ColorThemeData(),
      ),
    ], child: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) => Stack(
        children: [
          child!,
          DropdownAlert(
            position: AlertPosition.BOTTOM,
          ),
        ],
      ),
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ColorThemeData>(context).themeColor,
      home: MyHomePage(),
    );
  }
}
