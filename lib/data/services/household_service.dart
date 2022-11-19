import 'package:injectable/injectable.dart';
import 'package:stacked/stacked.dart';
import 'package:sample_fluttercase/data/models/household_model.dart';

@LazySingleton()
class HouseholdService with ReactiveServiceMixin {
  final ReactiveValue<List<HouseholdModel>> _households =
      ReactiveValue<List<HouseholdModel>>([]);
  List<HouseholdModel> getHouseholds() => _households.value;
  void setHouseholds(List<HouseholdModel> newHouseholds) =>
      _households.value = newHouseholds;

  void updateConsumption(
      String serviceNumber, ConsumptionDataModel newConsumption,
      {bool save = false}) {
    final isContainsHouseHold = _households.value
        .any((element) => element.serviceNumber == serviceNumber);
    if (isContainsHouseHold) {
      final houseHold = _households.value
          .firstWhere((element) => element.serviceNumber == serviceNumber);
      houseHold.readings?.add(newConsumption);
      if (save) houseHold.save();
    }
  }
}
