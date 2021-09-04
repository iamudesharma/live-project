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
    return SizedBox(
      // color: Colors.grey[200],
      width: context.width,

      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (Responsive.isMobile(context))
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: CustomAppbarIcon(
                icon: Icons.menu,
                title: 'Menu',
                onTap: () {},
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Global',
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w800,
                    color: Colors.blue,
                  ),
                ),
                const VerticalDivider(
                  color: Colors.black,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Refrigeration',
                      style: TextStyle(fontSize: 25, color: Colors.black),
                    ),
                    Text(
                      '& Company',
                      style: TextStyle(fontSize: 25, color: Colors.black),
                    )
                  ],
                )
              ],
            ),
          ),
          if (!Responsive.isMobile(context))
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
                  width: 20,
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
                  width: 20,
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
                  width: 20,
                ),
                CustomAppbarIcon(
                  icon: Icons.article,
                  title: !Responsive.isTablet(context) ? 'Service' : null,
                  onTap: () {
                    setState(() {
                      widget.controller.animateToPage(2,
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.easeIn);
                    });
                  },
                ),
                const SizedBox(
                  width: 20,
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
    this.title,
    required this.icon,
    this.onTap,
  }) : super(key: key);

  final String? title;
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
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 27,
                color: Theme.of(context).primaryColor,
              ),
              !Responsive.isMobile(context)
                  ? const SizedBox(
                      width: 10,
                    )
                  : const SizedBox.shrink(),
              Text(
                title ?? '',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 17,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
