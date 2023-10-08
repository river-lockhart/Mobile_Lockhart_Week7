import 'package:flutter/material.dart';
import 'package:lockhart_week7/Models/globalItems.dart';

import 'Models/item.dart';
import 'Views/editItemPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Lockhart Week 7'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _handleButtonPress(Item item) async {
    final updatedItem = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EditItemPage(item: item)),
    );
    if (updatedItem != null) {
      setState(() {
        final index = GlobalItems()
            .items
            .indexWhere((element) => element.id == updatedItem.id);
        if (index != -1) {
          GlobalItems().items[index] = updatedItem;
        }
      });
    }
  }

  void _handleDelete(Item item) {
    setState(() {
      GlobalItems().items.removeWhere((element) => element.id == item.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Center(
            child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: GlobalItems().items.map((item) {
                      return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Item ID: ${item.id}',
                                  style: TextStyle(fontSize: 20),
                                ),
                                Text(
                                  'Item Name: ${item.name}',
                                  style: TextStyle(fontSize: 20),
                                ),
                                Text(
                                  'Item information: ${item.description}',
                                  style: TextStyle(fontSize: 20),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    _handleButtonPress(item);
                                  },
                                  child: const Text('Change Item'),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    _handleDelete(item);
                                  },
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.red),
                                      foregroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.white)),
                                  child: const Text('Delete Item'),
                                ),
                                const Divider(),
                              ]));
                    }).toList()))));
  }
}
