import 'package:flutter/material.dart';
import 'package:live_project_1/data/page_data.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late PageController controller;

  @override
  void initState() {
    controller = PageController(
      keepPage: true,
      initialPage: 0,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(onPressed: () {
              setState(() {
                controller.jumpToPage(0);
              });
            }),
            const SizedBox(
              height: 15,
            ),
            FloatingActionButton(onPressed: () {
              setState(() {
                controller.jumpToPage(1);
              });
            }),
            const SizedBox(
              height: 15,
            ),
            FloatingActionButton(onPressed: () {
              setState(() {
                controller.jumpToPage(2);
              });
            }),
            const SizedBox(
              height: 15,
            ),
            FloatingActionButton(onPressed: () {
              setState(() {
                controller.jumpToPage(3);
              });
            }),
          ],
        ),
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: PageView.builder(
          controller: controller,
          itemCount: ListWidgetDate.widget.length,
          itemBuilder: (context, index) =>
              ListWidgetDate.widget.elementAt(index),
        ),
      ),
    );
  }
}
