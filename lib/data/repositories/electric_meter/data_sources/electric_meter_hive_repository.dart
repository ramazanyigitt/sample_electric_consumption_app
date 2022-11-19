import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sample_fluttercase/data/models/slab_model.dart';

import 'package:sample_fluttercase/core/utils/extensions/dartz_extension.dart';

import '../../../../domain/repositories/electric_meter/data_sources/ilocal_repository.dart';

@LazySingleton(as: IElectricMeterLocalRepository)
class ElectricMeterHiveRepository implements IElectricMeterLocalRepository {
  @override
  Future<DataModel<List<SlabModel>>> getLatestSlabs() async {
    return Right([]);
  }

  @override
  Future<void> saveLatestSlabs(List<SlabModel> slabs) async {
    //
  }
}
