import 'package:flutter/material.dart';
import 'package:live_project_1/view/about_view.dart';
import 'package:live_project_1/view/contact_view.dart';
import 'package:live_project_1/view/home_view.dart';
import 'package:live_project_1/view/service_view.dart';

class ListWidgetDate {
  static List<Widget> widget = [
    const HomeView(),
    const AboutView(),
    const ServiceView(),
    const ContactView(),
  ];
}
