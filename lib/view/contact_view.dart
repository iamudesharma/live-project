import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';

import 'package:live_project_1/controller/contact_controller.dart';
import 'package:live_project_1/widgets/contact_textfield_widget.dart';

class ContactView extends GetView<ContactController> {
  const ContactView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxHeight: 600,
            minHeight: 500,
            maxWidth: 800,
            minWidth: 600,
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.grey[300],
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade500,
                  offset: const Offset(4.0, 4.0),
                  blurRadius: 15,
                  spreadRadius: 1.0,
                ),
                const BoxShadow(
                  color: Colors.white,
                  offset: Offset(-4.0, -4.0),
                  blurRadius: 15,
                  spreadRadius: 1.0,
                )
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    'Contact Us',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 35,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  ContactTextField(
                    controller: controller.nameController,
                    hintext: 'Name',
                    iconData: Icons.person,
                    labelText: 'Name',
                  ),
                  ContactTextField(
                    controller: controller.emailController,
                    hintext: 'Email',
                    iconData: Icons.person,
                    labelText: 'Email',
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  ContactTextField(
                    controller: controller.phoneController,
                    hintext: 'Phone Number',
                    iconData: Icons.person,
                    labelText: 'Phone Number',
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  ContactTextField(
                    controller: controller.desController,
                    hintext: 'DEs',
                    iconData: Icons.person,
                    labelText: 'Des',
                    maxLines: 3,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    width: 300,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        'Submit',
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      ContactIcon(
                        icon: Icons.mail,
                      ),
                      ContactIcon(icon: Icons.phone)
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ContactIcon extends StatelessWidget {
  const ContactIcon({
    Key? key,
    required this.icon,
  }) : super(key: key);

  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        // color: Colors.white,
        shape: BoxShape.circle,
        color: Colors.grey[300],
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade500,
            offset: const Offset(4.0, 4.0),
            blurRadius: 15,
            spreadRadius: 1.0,
          ),
          const BoxShadow(
            color: Colors.white,
            offset: Offset(-4.0, -4.0),
            blurRadius: 15,
            spreadRadius: 1.0,
          ),
        ],
      ),
      child: Icon(
        icon,
        size: 35,
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
