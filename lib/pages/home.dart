import 'package:flutter/material.dart';
import 'package:flutter_sqlite/helpers/sql_helper.dart';
import 'package:flutter_sqlite/pages/entryform.dart';
import 'package:sqflite/sqflite.dart';

import '../../models/item.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int count = 0;
  List<Item> itemList = [];
  @override
  void initState() {
    updateListView();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Yudas Malabi - 2041720054'),
        ),
        body: Column(
          children: [
            Expanded(
              child: createListView(),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  child: const Text('Tambah Item'),
                  onPressed: () async {
                    Item item = await navigateToEntryForm(context, null);
                    if (item != null) {
                      int result = await SQLHelper.createItem(item);

                      if (result > 0) updateListView();
                    }
                  },
                ),
              ),
            )
          ],
        ));
  }

  ListView createListView() {
    TextStyle? textStyle = Theme.of(context).textTheme.headline5;
    return ListView.builder(
        itemCount: count,
        itemBuilder: (BuildContext context, int index) => Card(
              color: Colors.white,
              elevation: 2.0,
              child: ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Colors.red,
                  child: Icon(Icons.ad_units),
                ),
                title: Text(
                  itemList[index].name,
                  style: textStyle,
                ),
                subtitle: Text(itemList[index].price.toString()),
                trailing: GestureDetector(
                  child: const Icon(Icons.delete),
                  onTap: () async {
                    SQLHelper.deleteItem(itemList[index].id);
                    updateListView();
                  },
                ),
                onTap: () async {
                  Item item =
                      await navigateToEntryForm(context, itemList[index]);
                  SQLHelper.updateItem(item);
                  updateListView();
                },
              ),
            ));
  }

  Future<Item> navigateToEntryForm(BuildContext context, Item? item) async {
    var result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EntryForm(item: item)),
    );
    return result;
  }

  void updateListView() {
    final Future<Database> dbFuture = SQLHelper.db();
    dbFuture.then((database) {
      // TODO: get all item from DB
      Future<List<Item>> itemListFuture = SQLHelper.getItemList();
      itemListFuture.then((itemList) {
        setState(() {
          this.itemList = itemList;
          count = itemList.length;
        });
      });
    });
  }
}
