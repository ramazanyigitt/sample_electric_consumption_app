import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../core/platform/network_info.dart';
import '../../../core/utils/extensions/dartz_extension.dart';
import '../../../domain/repositories/electric_meter/data_sources/ilocal_repository.dart';
import '../../../domain/repositories/electric_meter/data_sources/iremote_repository.dart';
import '../../../domain/repositories/electric_meter/ielectric_meter_repository.dart';
import '../../models/slab_model.dart';

@LazySingleton()
class ElectricMeterRepository implements IElectricMeterRepository {
  final IElectricMeterRemoteRepository remoteDataSource;
  final IElectricMeterLocalRepository localDataSource;
  final NetworkInfo networkInfo;
  const ElectricMeterRepository({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<DataModel<List<SlabModel>>> getSlabs() async {
    if (await networkInfo.isConnected) {
      final responseSlabs = await remoteDataSource.getSlabs();
      if (responseSlabs is Right) {
        localDataSource.saveLatestSlabs(responseSlabs.asRight());
      }
      return responseSlabs;
    } else {
      return localDataSource.getLatestSlabs();
    }
  }
}
