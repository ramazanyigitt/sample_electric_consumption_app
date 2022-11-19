import '../../../../core/utils/extensions/dartz_extension.dart';
import '../../../../data/models/slab_model.dart';

abstract class IElectricMeterRemoteRepository {
  Future<DataModel<List<SlabModel>>> getSlabs();
}
