import '../../../core/utils/extensions/dartz_extension.dart';
import '../../entities/household.dart';

abstract class IHouseholdRepository {
  Future<DataModel<List<Household>>> getHouseholds();
}
