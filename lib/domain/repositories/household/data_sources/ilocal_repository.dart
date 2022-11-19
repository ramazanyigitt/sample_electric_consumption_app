import '../../../../core/utils/extensions/dartz_extension.dart';
import '../../../../data/models/household_model.dart';

abstract class IHouseholdLocalRepository {
  Future<DataModel<List<HouseholdModel>>> getHouseholds();
  Future<void> saveHouseholds(List<HouseholdModel> houseHolds);
  Future<void> addHousehold(HouseholdModel householdModel);
  Future<void> updateHousehold(HouseholdModel householdModel);
}
