import 'package:sample_fluttercase/core/utils/extensions/dartz_extension.dart';
import 'package:sample_fluttercase/data/models/household_model.dart';

import '../../../entities/household.dart';

abstract class IHouseholdRemoteRepository {
  Future<DataModel<List<HouseholdModel>>> getHouseholds();
}
