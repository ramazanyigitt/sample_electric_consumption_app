import 'package:equatable/equatable.dart';

import '../../data/models/household_model.dart';

class Household extends Equatable {
  String? serviceNumber;
  List<ConsumptionDataModel>? readings;
  Household({
    this.serviceNumber,
    this.readings,
  });

  @override
  List<Object?> get props => [serviceNumber, readings];
}
