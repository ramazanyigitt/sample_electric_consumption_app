import '../../../../core/utils/extensions/dartz_extension.dart';
import '../../../../domain/repositories/electric_meter/data_sources/iremote_repository.dart';
import '../../../models/slab_model.dart';

class ElectricMeterHttpRepository implements IElectricMeterRemoteRepository {
  @override
  Future<DataModel<List<SlabModel>>> getSlabs() {
    // TODO: implement getSlabs
    throw UnimplementedError();
  }
}
