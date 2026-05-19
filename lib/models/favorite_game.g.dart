// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_game.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FavoriteGameAdapter extends TypeAdapter<FavoriteGame> {
  @override
  final int typeId = 0;

  @override
  FavoriteGame read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FavoriteGame(
      id: fields[0] as int,
      title: fields[1] as String,
      genre: fields[2] as String,
      platform: fields[3] as String,
      thumbnail: fields[4] as String,
      releaseDate: fields[5] as String,
      publisher: fields[6] as String,
      developer: fields[7] as String,
      description: fields[8] as String,
      // screenshots: fields[9] as String,
    );
  }

  @override
  void write(BinaryWriter writer, FavoriteGame obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.genre)
      ..writeByte(3)
      ..write(obj.platform)
      ..writeByte(4)
      ..write(obj.thumbnail)
      ..writeByte(5)
      ..write(obj.releaseDate)
      ..writeByte(6)
      ..write(obj.publisher)
      ..writeByte(7)
      ..write(obj.developer)
      ..writeByte(8)
      ..write(obj.description);
    // ..writeByte(9)
    // ..write(obj.screenshots);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavoriteGameAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
