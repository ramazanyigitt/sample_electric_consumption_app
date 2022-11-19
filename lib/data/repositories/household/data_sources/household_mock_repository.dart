import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sample_fluttercase/data/models/household_model.dart';
import 'package:sample_fluttercase/domain/entities/household.dart';
import 'package:sample_fluttercase/core/utils/extensions/dartz_extension.dart';
import 'package:sample_fluttercase/domain/repositories/household/data_sources/iremote_repository.dart';
import 'package:sample_fluttercase/injection/injection_container.dart';

import '../../../../core/utils/services/mock_reader_service.dart';

@Environment('mock')
@LazySingleton(as: IHouseholdRemoteRepository)
class HouseholdMockRepository implements IHouseholdRemoteRepository {
  @override
  Future<DataModel<List<HouseholdModel>>> getHouseholds() async {
    final response =
        await locator<MockReaderService>().callMockList<HouseholdModel>(
      'test/fixtures/households.json',
      HouseholdModel.new,
    );
    return Right(response);
  }
}
