import 'package:flutter/material.dart';
import 'package:flutter_dropdown_alert/alert_controller.dart';
import 'package:flutter_dropdown_alert/model/data_alert.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/color_theme_data.dart';
import 'package:todo_app/models/items_data.dart';

class ItemAdd extends StatelessWidget {
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                margin: EdgeInsets.only(top: 5),
                child: TextField(
                  cursorColor:
                      Provider.of<ColorThemeData>(context).isRed == true
                          ? Colors.redAccent
                          : Colors.teal,
                  autocorrect: true,
                  minLines: 1,
                  maxLines: 4,
                  controller: textController,
                  onChanged: (value) {},
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Add Item',
                    labelStyle: TextStyle(
                        letterSpacing: 2,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                    hintText: '...',
                  ),
                  autofocus: true,
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.black),
                onPressed: () {
                  Provider.of<ItemData>(context, listen: false)
                      .addItem(textController.text);
                  Navigator.pop(context);
                  AlertController.show('New Item', 'Another Todo in your list',
                      TypeAlert.success);
                },
                child: Text(
                  'ADD',
                  style: TextStyle(
                      color: Provider.of<ColorThemeData>(context).isRed == true
                          ? Colors.redAccent
                          : Colors.teal),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
