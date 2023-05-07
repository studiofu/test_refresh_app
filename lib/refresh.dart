import 'package:flutter/material.dart';

class Refresh extends StatefulWidget {
  const Refresh({super.key});

  @override
  State<Refresh> createState() => _RefreshState();
}

class _RefreshState extends State<Refresh> {
  final items = [
    'item 1',
    'item 2',
    'item 3',
    'item 4',
    'item 5',
    'item 6',
    'item 7',
    'item 8',
    'item 9',
    'item 10',
    'item 11',
    'item 12',
    'item 13',
    'item 14',
    'item 15',
  ];

  // need scroll contorller to check if the list is at the bottom
  final controller = ScrollController();

  //create scroll controller listener
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.addListener(() {
      if (controller.position.atEdge) {
        if (controller.position.pixels == 0) {
          print('at the top');
        } else {
          print('at the bottom');
          setState(() {
            // fetch more items...
            items.add('item ${items.length + 1}');
            items.add('item ${items.length + 1}');
            items.add('item ${items.length + 1}');
            items.add('item ${items.length + 1}');
            items.add('item ${items.length + 1}');
          });
        }
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () {
        // insert item to the top of the list
        return Future.delayed(const Duration(seconds: 1), () {
          setState(() {
            items.insert(0, 'item ${items.length + 1}');
          });
        });
      },
      child: ListView.builder(
          controller: controller,
          itemCount: items.length + 1,
          itemBuilder: (context, index) {
            if (index < items.length) {
              return ListTile(
                title: Text('index: $index - ${items[index]}'),
              );
            } else {
              return const SizedBox(
                height: 100,
                child: Center(
                  child: Text('Loading...'),
                ),
              );
            }
          }),
    );
  }
}
