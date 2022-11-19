// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'slab_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SlabModelAdapter extends TypeAdapter<SlabModel> {
  @override
  final int typeId = 1;

  @override
  SlabModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SlabModel(
      pricePerUnit: fields[0] as num?,
      minConsumption: fields[1] as int?,
      maxConsumption: fields[2] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, SlabModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.pricePerUnit)
      ..writeByte(1)
      ..write(obj.minConsumption)
      ..writeByte(2)
      ..write(obj.maxConsumption);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SlabModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
