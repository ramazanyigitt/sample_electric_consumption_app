import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:sample_fluttercase/core/utils/extensions/context_extension.dart';
import 'package:sample_fluttercase/data/models/household_model.dart';
import 'package:sample_fluttercase/domain/entities/consumption_data.dart';
import 'package:sample_fluttercase/features/home/home_view.dart';
import 'package:sample_fluttercase/features/households/detail/household_detail_viewmodel.dart';

import '../../../shared/app_theme.dart';

part 'widgets/top_section.dart';
part 'widgets/previous_consumptions.dart';
part 'widgets/save_button.dart';

class HouseholdDetailView extends StatelessWidget {
  final HouseholdModel householdModel;
  final bool isAlreadyExists;
  const HouseholdDetailView({
    Key? key,
    required this.householdModel,
    required this.isAlreadyExists,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
      viewModelBuilder: () => HouseholdDetailViewModel(
        householdModel: householdModel,
        isAlreadyExists: isAlreadyExists,
      ),
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: const Color(0xffFDFDFD),
          body: SafeArea(
            bottom: false,
            child: SizedBox(
              height: context.height,
              width: context.width,
              child: Stack(
                children: [
                  Positioned(
                    bottom: context.normalValue * 2,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: context.paddingNormalVertical,
                      child: _SaveButton(),
                    ),
                  ),
                  Column(
                    children: [
                      const _TopSection(),
                      Padding(padding: context.paddingNormal),
                      const _PreviousConsumptions(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
