import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';

import '../../domain/entities/slab.dart';

part 'slab_model.g.dart';

@HiveType(typeId: 1)
class SlabModel extends Slab with HiveObjectMixin {
  @HiveField(0)
  num? pricePerUnit;
  @HiveField(1)
  int? minConsumption;
  @HiveField(2)
  int? maxConsumption;

  SlabModel({
    this.pricePerUnit,
    this.minConsumption,
    this.maxConsumption,
  }) : super(
          pricePerUnit: pricePerUnit,
          maxConsumption: maxConsumption,
          minConsumption: minConsumption,
        );

  SlabModel copyWith({
    int? pricePerUnit,
    int? minConsumption,
    int? maxConsumption,
  }) =>
      SlabModel(
        pricePerUnit: pricePerUnit ?? this.pricePerUnit,
        minConsumption: minConsumption ?? this.minConsumption,
        maxConsumption: maxConsumption ?? this.maxConsumption,
      );

  fromRawJson(String str) => fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  fromJson(Map<String, dynamic> json) => SlabModel(
        pricePerUnit:
            json["pricePerUnit"] == null ? null : json["pricePerUnit"],
        minConsumption:
            json["minConsumption"] == null ? null : json["minConsumption"],
        maxConsumption:
            json["maxConsumption"] == null ? null : json["maxConsumption"],
      );

  Map<String, dynamic> toJson() => {
        "pricePerUnit": pricePerUnit == null ? null : pricePerUnit,
        "minConsumption": minConsumption == null ? null : minConsumption,
        "maxConsumption": maxConsumption == null ? null : maxConsumption,
      };
}
