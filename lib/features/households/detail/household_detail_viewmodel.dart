import 'package:get/route_manager.dart';
import 'package:stacked/stacked.dart';
import 'package:sample_fluttercase/data/models/household_model.dart';
import 'package:sample_fluttercase/data/repositories/household/household_repository.dart';
import 'package:sample_fluttercase/features/home/home_view.dart';

import '../../../data/services/household_service.dart';
import '../../../injection/injection_container.dart';

class HouseholdDetailViewModel extends BaseViewModel {
  final HouseholdModel householdModel;
  final bool isAlreadyExists;
  HouseholdDetailViewModel({
    required this.householdModel,
    required this.isAlreadyExists,
  });

  void onSave() async {
    if (isAlreadyExists) {
      await locator<HouseholdRepository>()
          .localDataSource
          .updateHousehold(householdModel);
    } else {
      await locator<HouseholdRepository>()
          .localDataSource
          .addHousehold(householdModel);
    }
    Get.off(
      () => HomeView(),
    );
  }
}
