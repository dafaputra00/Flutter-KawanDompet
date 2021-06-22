// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaksi.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class transaksiNeedsAdapter extends TypeAdapter<transaksiNeeds> {
  @override
  final int typeId = 0;

  @override
  transaksiNeeds read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return transaksiNeeds()
      ..name = fields[0] as String
      ..createdDate = fields[1] as DateTime
      ..isExpense = fields[2] as bool
      ..amount = fields[3] as double;
  }

  @override
  void write(BinaryWriter writer, transaksiNeeds obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.createdDate)
      ..writeByte(2)
      ..write(obj.isExpense)
      ..writeByte(3)
      ..write(obj.amount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is transaksiNeedsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class transaksiWantsAdapter extends TypeAdapter<transaksiWants> {
  @override
  final int typeId = 1;

  @override
  transaksiWants read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return transaksiWants()
      ..name = fields[0] as String
      ..createdDate = fields[1] as DateTime
      ..isExpense = fields[2] as bool
      ..amount = fields[3] as double;
  }

  @override
  void write(BinaryWriter writer, transaksiWants obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.createdDate)
      ..writeByte(2)
      ..write(obj.isExpense)
      ..writeByte(3)
      ..write(obj.amount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is transaksiWantsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class transaksiSavingsAdapter extends TypeAdapter<transaksiSavings> {
  @override
  final int typeId = 2;

  @override
  transaksiSavings read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return transaksiSavings()
      ..name = fields[0] as String
      ..createdDate = fields[1] as DateTime
      ..isExpense = fields[2] as bool
      ..amount = fields[3] as double;
  }

  @override
  void write(BinaryWriter writer, transaksiSavings obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.createdDate)
      ..writeByte(2)
      ..write(obj.isExpense)
      ..writeByte(3)
      ..write(obj.amount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is transaksiSavingsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
