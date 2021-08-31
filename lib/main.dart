import 'dart:html';

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

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
          itemCount: widget.length,
          itemBuilder: (context, index) => widget.elementAt(index),
        ),
      ),
    );
  }
}

List<Widget> widget = [
  const HomePage(),
  const AboutPage(),
  const ServicePage(),
  const ContactPage(),
];

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'HomePage',
        style: Theme.of(context).textTheme.headline5,
      ),
    );
  }
}

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'AboutPage',
        style: Theme.of(context).textTheme.headline2,
      ),
    );
  }
}

class ServicePage extends StatelessWidget {
  const ServicePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'ServicePage',
        style: Theme.of(context).textTheme.headline2,
      ),
    );
  }
}

class ContactPage extends StatelessWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'ContactPage',
        style: Theme.of(context).textTheme.headline2,
      ),
    );
  }
}
