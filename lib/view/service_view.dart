import 'package:flutter/material.dart';

class ServiceView extends StatelessWidget {
  const ServiceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'ServiceView',
        style: Theme.of(context).textTheme.headline2,
      ),
    );
  }
}
