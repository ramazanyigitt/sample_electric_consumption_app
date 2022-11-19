import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sample_fluttercase/data/models/slab_model.dart';
import 'package:sample_fluttercase/core/utils/extensions/dartz_extension.dart';
import 'package:sample_fluttercase/injection/injection_container.dart';

import '../../../../core/utils/services/mock_reader_service.dart';

import '../../../../domain/repositories/electric_meter/data_sources/iremote_repository.dart';

@Environment('mock')
@LazySingleton(as: IElectricMeterRemoteRepository)
class ElectricMeterMockRepository implements IElectricMeterRemoteRepository {
  @override
  Future<DataModel<List<SlabModel>>> getSlabs() async {
    final response = await locator<MockReaderService>().callMockList<SlabModel>(
      'test/fixtures/slabs.json',
      SlabModel.new,
    );
    return Right(response);
  }
}
