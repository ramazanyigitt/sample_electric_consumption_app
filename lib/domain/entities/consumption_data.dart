import 'package:equatable/equatable.dart';

class ConsumptionData extends Equatable {
  ConsumptionData({
    this.reading,
    this.date,
    this.cost,
  });
  int? reading;
  DateTime? date;
  int? cost;

  @override
  List<Object?> get props => [reading, date, cost];
}
