import 'package:injectable/injectable.dart';
import 'package:stacked/stacked.dart';
import 'package:sample_fluttercase/data/models/household_model.dart';
import 'package:sample_fluttercase/data/models/slab_model.dart';

@LazySingleton()
class ElectricityService with ReactiveServiceMixin {
  final ReactiveValue<List<SlabModel>> _slabs =
      ReactiveValue<List<SlabModel>>([]);
  List<SlabModel> getSlabs() => _slabs.value;
  void setSlabs(List<SlabModel> newSlabs) => _slabs.value = newSlabs;

  int calculateConsumptions(int oldReading, int newReading) {
    final diff = newReading - oldReading;
    getSlabs().sort((a, b) => a.minConsumption!.compareTo(b.minConsumption!));
    var remainingUnitAmount = diff;
    var price = 0;
    for (var slab in _slabs.value) {
      if (slab.maxConsumption == null) {
        price += (remainingUnitAmount * slab.pricePerUnit!).toInt();
        remainingUnitAmount = 0;
        continue;
      }
      remainingUnitAmount = remainingUnitAmount - slab.maxConsumption!;
      if (remainingUnitAmount > 0) {
        price += (slab.maxConsumption! * slab.pricePerUnit!).toInt();
      } else {
        price +=
            ((slab.maxConsumption! - remainingUnitAmount) * slab.pricePerUnit!)
                .toInt();
      }
    }
    return price;
  }
}
