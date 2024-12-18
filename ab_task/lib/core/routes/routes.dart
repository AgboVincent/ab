import 'package:ab_task/view/pages/pages.dart';
import 'package:flutter/material.dart';
import '../../view/home/home_screen.dart';




var customRoutes = <String, WidgetBuilder>{
  '/pages': (context) => const PagesScreen(),
  '/home': (context) => const HomeScreen(),
};
