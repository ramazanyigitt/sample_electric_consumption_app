import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:stacked/stacked.dart';
import 'package:sample_fluttercase/core/utils/extensions/context_extension.dart';
import 'package:sample_fluttercase/core/utils/extensions/dartz_extension.dart';
import 'package:sample_fluttercase/data/repositories/household/household_repository.dart';
import 'package:sample_fluttercase/data/services/household_service.dart';
import 'package:sample_fluttercase/injection/injection_container.dart';

import '../../../shared/app_theme.dart';
import '../../_components/household_card.dart';

part 'home_viewmodel.dart';
part 'widgets/household_section.dart';
part 'widgets/top_section.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
      viewModelBuilder: () => HomeViewModel(),
      onModelReady: (model) => model.init(),
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: const Color(0xffFDFDFD),
          body: SafeArea(
            bottom: false,
            child: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  const _TopSection(),
                ];
              },
              body: const CustomScrollView(
                slivers: [
                  _HouseholdSection(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
