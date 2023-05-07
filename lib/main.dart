import 'package:flutter/material.dart';
import 'package:test_refresh_app/refresh.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool showBottomSheet = true;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'This is Scrolling Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: const Text('This is Scrolling Demo'),
            actions: [
              IconButton(icon: const Icon(Icons.refresh), onPressed: () {})
            ],
          ),
          body: Refresh(),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: 0,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: 'Settings'),
            ],
          ),
          bottomSheet: showBottomSheet == true
              ? InkWell(
                  onTap: () {
                    setState(() {
                      showBottomSheet = false;
                    });
                  },
                  child: Container(
                      height: 100,
                      color: Colors.blue,
                      child: const Center(
                        child: Text(
                          'This is bottom sheet',
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
                )
              : null),
    );
  }
}
