import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/items_data.dart';
import '../settings_page.dart';
import '../widgets/item_card.dart';
import 'item_add_screen.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SettingsPage()));
                },
                icon: Icon(
                  Icons.settings,
                  color: Colors.black,
                )),
          )
        ],
        title: Text(
          'TODO',
          style: TextStyle(color: Colors.black, letterSpacing: 2),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(40))),
          child: Consumer<ItemData>(
            builder: (context, itemData, child) {
              return Align(
                alignment: Alignment.topCenter,
                child: ListView.builder(
                  shrinkWrap: true,
                  reverse: true,
                  padding: EdgeInsets.all(12),
                  itemBuilder: (context, index) => ItemCard(
                      isDone: itemData.items[index].isDone,
                      title: itemData.items[index].title,
                      toggleStatus: (_) {
                        Provider.of<ItemData>(context, listen: false)
                            .toggleStatus(index);
                      },
                      deleteItem: (_) {
                        Provider.of<ItemData>(context, listen: false)
                            .deleteItem(index);
                      }),
                  itemCount: itemData.items.length,
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: StadiumBorder(side: BorderSide.none),
        backgroundColor: Colors.black,
        onPressed: () {
          showModalBottomSheet(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              context: context,
              builder: (context) => ItemAdd());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
