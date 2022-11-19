import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sample_fluttercase/data/models/household_model.dart';

import 'package:sample_fluttercase/domain/repositories/household/data_sources/ilocal_repository.dart';
import 'package:sample_fluttercase/domain/repositories/household/data_sources/iremote_repository.dart';
import 'package:sample_fluttercase/domain/repositories/household/ihousehold_repository.dart';

import '../../../core/platform/network_info.dart';
import '../../../core/utils/extensions/dartz_extension.dart';

@LazySingleton()
class HouseholdRepository implements IHouseholdRepository {
  final IHouseholdRemoteRepository remoteDataSource;
  final IHouseholdLocalRepository localDataSource;
  final NetworkInfo networkInfo;
  const HouseholdRepository({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<DataModel<List<HouseholdModel>>> getHouseholds() async {
    if (await networkInfo.isConnected) {
      final responseHouseholds = await remoteDataSource.getHouseholds();
      if (responseHouseholds is Right) {
        localDataSource.saveHouseholds(responseHouseholds.asRight());
      }
      return responseHouseholds;
    } else {
      return localDataSource.getHouseholds();
    }
  }
}
