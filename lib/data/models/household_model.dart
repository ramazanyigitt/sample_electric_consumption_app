import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:sample_fluttercase/domain/entities/consumption_data.dart';

import '../../domain/entities/household.dart';

part 'household_model.g.dart';

@HiveType(typeId: 0)
class HouseholdModel extends Household with HiveObjectMixin {
  @HiveField(0)
  String? serviceNumber;
  @HiveField(1)
  List<ConsumptionDataModel>? readings;
  HouseholdModel({
    this.serviceNumber,
    this.readings,
  }) : super(
          readings: readings,
          serviceNumber: serviceNumber,
        );

  HouseholdModel copyWith({
    String? serviceNumber,
    int? previousReading,
  }) =>
      HouseholdModel(
        serviceNumber: serviceNumber ?? this.serviceNumber,
        readings: readings ?? this.readings,
      );

  void updateFromJson(Map<String, dynamic> json) {
    serviceNumber =
        json["serviceNumber"] == null ? null : json["serviceNumber"];
    readings = json["readings"] == null
        ? null
        : List<ConsumptionDataModel>.from(
            json["readings"].map(
              (x) => ConsumptionDataModel().fromJson(x),
            ),
          );
  }

  fromRawJson(String str) => fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  fromJson(Map<String, dynamic> json) => HouseholdModel(
        serviceNumber:
            json["serviceNumber"] == null ? null : json["serviceNumber"],
        readings: json["readings"] == null
            ? null
            : List<ConsumptionDataModel>.from(
                json["readings"].map(
                  (x) => ConsumptionDataModel().fromJson(x),
                ),
              ),
      );

  Map<String, dynamic> toJson() => {
        "serviceNumber": serviceNumber == null ? null : serviceNumber,
        "readings":
            readings == null ? null : readings?.map((e) => e.toJson()).toList(),
      };
}

@HiveType(typeId: 2)
class ConsumptionDataModel extends ConsumptionData with HiveObjectMixin {
  ConsumptionDataModel({
    this.reading,
    this.date,
    this.cost,
  });

  @HiveField(0)
  int? reading;
  @HiveField(1)
  DateTime? date;
  @HiveField(2)
  int? cost;

  ConsumptionDataModel copyWith({
    int? reading,
    DateTime? date,
  }) =>
      ConsumptionDataModel(
        reading: reading ?? this.reading,
        date: date ?? this.date,
        cost: cost ?? this.cost,
      );

  fromRawJson(String str) => fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  fromJson(Map<String, dynamic> json) => ConsumptionDataModel(
        reading: json["reading"] == null ? null : json["reading"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        cost: json["cost"] == null ? null : json["cost"],
      );

  Map<String, dynamic> toJson() => {
        "reading": reading == null ? null : reading,
        "cost": cost == null ? null : cost,
        "date": date == null
            ? null
            : "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
      };
}
