import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'splash_viewmodel.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashViewModel>.nonReactive(
      viewModelBuilder: () => SplashViewModel(),
      onModelReady: (model) => model.loadApp(context),
      builder: (context, model, child) {
        return Scaffold(
          body: Container(
            color: Colors.white,
            child: const Center(
              child: Text('Loading...'),
            ),
          ),
        );
      },
    );
  }
}
