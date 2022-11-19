import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:stacked/stacked.dart';

import '../home/home_view.dart';

class SplashViewModel extends BaseViewModel {
  Future<void> loadApp(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 1));
    Get.off(
      () => const HomeView(),
    );
  }
}
