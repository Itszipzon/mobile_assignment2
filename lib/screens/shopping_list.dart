import 'package:flutter/material.dart';

/// Screen to create a shopping list. (Created by us.)
class ShoppingList extends StatefulWidget {
  const ShoppingList({Key? key, required this.items}) : super(key: key);

  final List<String> items;

  @override
  State<ShoppingList> createState() {
    return _ShoppingListState();
  }
}

/// State of the shopping list.
class _ShoppingListState extends State<ShoppingList> {

  void _addItem(String item) {
    setState(() {
      widget.items.add(item);
    });
  }

  void _removeItem(int index) {
    setState(() {
      widget.items.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping List'),
      ),
      body: ListView.builder(
        itemCount: widget.items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(widget.items[index]),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () => _removeItem(index),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              final controller = TextEditingController();

              return AlertDialog(
                title: const Text('Add Item', style: TextStyle(color: Colors.white)),
                content: TextField(
                  controller: controller,
                  decoration: const InputDecoration(
                    labelText: 'Item',
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      _addItem(controller.text);
                      Navigator.of(context).pop();
                    },
                    child: const Text('Add'),
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}