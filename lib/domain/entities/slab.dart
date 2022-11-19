import 'package:equatable/equatable.dart';

class Slab extends Equatable {
  num? pricePerUnit;
  int? minConsumption;
  int? maxConsumption;
  Slab({
    this.pricePerUnit,
    this.minConsumption,
    this.maxConsumption,
  });

  @override
  List<Object?> get props => [
        pricePerUnit,
        minConsumption,
        maxConsumption,
      ];
}
