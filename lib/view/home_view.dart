import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'HomeView',
        style: Theme.of(context).textTheme.headline5,
      ),
    );
  }
}