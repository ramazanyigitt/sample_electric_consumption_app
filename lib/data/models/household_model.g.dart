// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'household_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HouseholdModelAdapter extends TypeAdapter<HouseholdModel> {
  @override
  final int typeId = 0;

  @override
  HouseholdModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HouseholdModel(
      serviceNumber: fields[0] as String?,
      readings: (fields[1] as List?)?.cast<ConsumptionDataModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, HouseholdModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.serviceNumber)
      ..writeByte(1)
      ..write(obj.readings);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HouseholdModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ConsumptionDataModelAdapter extends TypeAdapter<ConsumptionDataModel> {
  @override
  final int typeId = 2;

  @override
  ConsumptionDataModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ConsumptionDataModel(
      reading: fields[0] as int?,
      date: fields[1] as DateTime?,
      cost: fields[2] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, ConsumptionDataModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.reading)
      ..writeByte(1)
      ..write(obj.date)
      ..writeByte(2)
      ..write(obj.cost);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ConsumptionDataModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
