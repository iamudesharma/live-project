import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(onPressed: () {
            setState(() {
              controller.animateToPage(0,
                  duration: const Duration(seconds: 1), curve: Curves.easeIn);
            });
          }),
          const SizedBox(
            height: 15,
          ),
          FloatingActionButton(onPressed: () {
            setState(() {
              controller.animateToPage(1,
                  duration: const Duration(seconds: 1), curve: Curves.easeIn);
            });
          }),
          const SizedBox(
            height: 15,
          ),
          FloatingActionButton(onPressed: () {
            setState(() {
              controller.animateToPage(2,
                  duration: const Duration(seconds: 1), curve: Curves.easeIn);
            });
          }),
          const SizedBox(
            // child: ResponsiveScreen(),
            height: 15,
          ),
          FloatingActionButton(onPressed: () {
            setState(() {
              // controller.jumpToPage(3);
              controller.animateToPage(3,
                  duration: const Duration(seconds: 1), curve: Curves.easeIn);
            });
          }),
        ],
      ),
      // appBar: PreferredSize(
      //     child: Container(
      //       color: Colors.black,
      //     ),
      //     preferredSize: Size(context.width, 50)),
      body: PageView.builder(
        allowImplicitScrolling: true,
        // dragStartBehavior:,
        pageSnapping: true,

        scrollBehavior: const ScrollBehavior(
            androidOverscrollIndicator: AndroidOverscrollIndicator.glow),
        physics: const NeverScrollableScrollPhysics(),
        reverse: true,
        scrollDirection: Axis.vertical,
        controller: controller,
        itemCount: ListWidgetDate.widget.length,
        itemBuilder: (context, index) => ListWidgetDate.widget.elementAt(index),
      ),
    );
  }
}
