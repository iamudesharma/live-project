import 'package:flutter/material.dart';

import 'package:live_project_1/controller/contact_controller.dart';

class ContactTextField extends StatelessWidget {
  const ContactTextField({
    Key? key,
    required this.controller,
    required this.hintext,
    required this.labelText,
    required this.iconData,
    this.maxLines,
  }) : super(key: key);

  final TextEditingController controller;
  final String hintext;
  final String labelText;
  final IconData iconData;

  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      child: TextField(
        maxLines: maxLines ?? 1,
        // maxLength: ,
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: Icon(
            iconData,
          ),
          hintText: hintext,
          labelText: labelText,
          border: const UnderlineInputBorder(),
        ),
      ),
    );
  }
}
