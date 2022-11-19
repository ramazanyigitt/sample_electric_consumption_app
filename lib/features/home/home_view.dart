import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:stacked/stacked.dart';
import 'package:sample_fluttercase/core/utils/extensions/context_extension.dart';
import 'package:sample_fluttercase/core/utils/extensions/dartz_extension.dart';
import 'package:sample_fluttercase/core/utils/services/validator_service.dart';
import 'package:sample_fluttercase/data/models/auto_validator_model.dart';
import 'package:sample_fluttercase/data/models/household_model.dart';
import 'package:sample_fluttercase/data/repositories/household/household_repository.dart';
import 'package:sample_fluttercase/data/services/electricity_service.dart';
import 'package:sample_fluttercase/data/services/household_service.dart';
import 'package:sample_fluttercase/features/_components/field_builder_auto.dart';
import 'package:sample_fluttercase/features/_components/sign_text_form_field.dart';
import 'package:sample_fluttercase/features/households/detail/household_detail_view.dart';
import 'package:sample_fluttercase/injection/injection_container.dart';

import '../../data/repositories/electric_meter/data_sources/electric_meter_mock_repository.dart';
import '../../data/repositories/electric_meter/electric_meter_repository.dart';
import '../../shared/app_theme.dart';
import '../_components/household_card.dart';

part 'home_viewmodel.dart';
part 'widgets/household_section.dart';
part 'widgets/top_section.dart';
part 'widgets/current_meter_input.dart';
part 'widgets/submit_button.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
      viewModelBuilder: () => HomeViewModel(),
      onModelReady: (model) => model.init(),
      builder: (context, model, child) {
        return Form(
          key: model.formKey,
          child: Scaffold(
            backgroundColor: const Color(0xffFDFDFD),
            body: SafeArea(
              bottom: false,
              child: SizedBox(
                height: context.height,
                width: context.width,
                child: Column(
                  children: [
                    const _TopSection(),
                    Padding(padding: context.paddingNormal),
                    const _HouseHoldInput(),
                    Padding(padding: context.paddingNormal),
                    const _CurrentMeterInput(),
                    Padding(padding: context.paddingNormal),
                    const _SubmitButton(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
