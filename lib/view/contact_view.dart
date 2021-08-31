import 'package:flutter/material.dart';

class ContactView extends StatelessWidget {
  const ContactView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'ContactView',
        style: Theme.of(context).textTheme.headline2,
      ),
    );
  }
}