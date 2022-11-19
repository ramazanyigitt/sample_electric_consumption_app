import 'package:flutter/material.dart';

class AppRouter {
  static AppRouter _instance = AppRouter._();

  AppRouter._();

  factory AppRouter() => _instance;

  late TabController tabController;
  GlobalKey<NavigatorState>? mainNavigatorKey = GlobalKey();
}
