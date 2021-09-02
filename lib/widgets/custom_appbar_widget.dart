import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:live_project_1/utils/responsive.dart';

class CustomAppBarWidget extends StatefulWidget {
  const CustomAppBarWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final PageController controller;

  @override
  State<CustomAppBarWidget> createState() => _CustomAppBarWidgetState();
}

class _CustomAppBarWidgetState extends State<CustomAppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.grey[200],
      width: context.width,
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(
            text: const TextSpan(
              children: [
                TextSpan(
                  text: 'lobal',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                  ),
                ),
              ],
              text: 'G',
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 35,
                  fontWeight: FontWeight.w800),
            ),
          ),
          // ClipRRect(
          //   borderRadius: BorderRadius.circular(15.0),
          //   child: Image.asset(
          //     'assets/logo.jpeg',
          //   ),
          // ),
          Row(
            children: [
              CustomAppbarIcon(
                icon: Icons.home,
                title: !Responsive.isTablet(context) ? 'Home' : '',
                onTap: () {
                  setState(() {
                    widget.controller.animateToPage(0,
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeIn);
                  });
                },
              ),
              const SizedBox(
                width: 30,
              ),
              CustomAppbarIcon(
                icon: Icons.contact_page,
                title: !Responsive.isTablet(context) ? 'Contact' : '',
                onTap: () {
                  setState(() {
                    widget.controller.animateToPage(3,
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeIn);
                  });
                },
              ),
              const SizedBox(
                width: 30,
              ),
              CustomAppbarIcon(
                icon: Icons.person,
                title: !Responsive.isTablet(context) ? 'About Us' : '',
                onTap: () {
                  setState(() {
                    widget.controller.animateToPage(2,
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeIn);
                  });
                },
              ),
              const SizedBox(
                width: 30,
              ),
              CustomAppbarIcon(
                icon: Icons.article,
                title: !Responsive.isTablet(context) ? 'Service' : '',
                onTap: () {
                  setState(() {
                    widget.controller.animateToPage(2,
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeIn);
                  });
                },
              ),
              const SizedBox(
                width: 30,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class CustomAppbarIcon extends StatelessWidget {
  const CustomAppbarIcon({
    Key? key,
    required this.title,
    required this.icon,
    this.onTap,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(15),
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
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 30,
                color: Theme.of(context).primaryColor,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                title,
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
