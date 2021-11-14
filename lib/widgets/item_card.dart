import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/color_theme_data.dart';

class ItemCard extends StatelessWidget {
  final String? title;
  final bool? isDone;
  final Function(bool?) toggleStatus;
  final Function(DismissDirection?) deleteItem;

  ItemCard(
      {this.title,
      this.isDone,
      required this.toggleStatus,
      required this.deleteItem});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      onDismissed: deleteItem,
      key: Key(title.toString()),
      child: Card(
        color: isDone == true ? Colors.black : Colors.white,
        elevation: isDone == true ? 1 : 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        child: ListTile(
          title: Text(
            title!,
            style: TextStyle(
              decoration: isDone == true ? TextDecoration.lineThrough : null,
              color: isDone == true ? Colors.white : Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
          trailing: Checkbox(
              onChanged: toggleStatus,
              value: isDone,
              activeColor: Provider.of<ColorThemeData>(context).isRed == true
                  ? Colors.redAccent
                  : Colors.teal),
        ),
      ),
    );
  }
}
