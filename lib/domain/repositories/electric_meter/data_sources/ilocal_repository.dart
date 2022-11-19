import 'package:sample_fluttercase/data/models/slab_model.dart';

import '../../../../core/utils/extensions/dartz_extension.dart';

abstract class IElectricMeterLocalRepository {
  Future<DataModel<List<SlabModel>>> getLatestSlabs();
  Future<void> saveLatestSlabs(List<SlabModel> slabs);
}
