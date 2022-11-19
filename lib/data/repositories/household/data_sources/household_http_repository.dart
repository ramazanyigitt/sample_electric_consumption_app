import 'package:injectable/injectable.dart';

import 'package:sample_fluttercase/core/utils/extensions/dartz_extension.dart';
import 'package:sample_fluttercase/domain/repositories/household/data_sources/iremote_repository.dart';

import '../../../models/household_model.dart';

@Environment('real')
@LazySingleton(as: IHouseholdRemoteRepository)
class HouseholdHttpRepository implements IHouseholdRemoteRepository {
  @override
  Future<DataModel<List<HouseholdModel>>> getHouseholds() {
    // TODO: implement getHouseholds
    throw UnimplementedError();
  }
}
