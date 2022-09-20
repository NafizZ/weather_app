// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_api_responses.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WeatherApiResponseAdapter extends TypeAdapter<WeatherApiResponse> {
  @override
  final int typeId = 0;

  @override
  WeatherApiResponse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WeatherApiResponse(
      coord: fields[0] as Coord?,
      weather: (fields[1] as List?)?.cast<Weather>(),
      base: fields[2] as String?,
      main: fields[3] as Main?,
      visibility: fields[4] as dynamic,
      wind: fields[5] as Wind?,
      clouds: fields[6] as Clouds?,
      dt: fields[7] as dynamic,
      sys: fields[8] as Sys?,
      timezone: fields[9] as dynamic,
      id: fields[10] as dynamic,
      name: fields[11] as String?,
      cod: fields[12] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, WeatherApiResponse obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.coord)
      ..writeByte(1)
      ..write(obj.weather)
      ..writeByte(2)
      ..write(obj.base)
      ..writeByte(3)
      ..write(obj.main)
      ..writeByte(4)
      ..write(obj.visibility)
      ..writeByte(5)
      ..write(obj.wind)
      ..writeByte(6)
      ..write(obj.clouds)
      ..writeByte(7)
      ..write(obj.dt)
      ..writeByte(8)
      ..write(obj.sys)
      ..writeByte(9)
      ..write(obj.timezone)
      ..writeByte(10)
      ..write(obj.id)
      ..writeByte(11)
      ..write(obj.name)
      ..writeByte(12)
      ..write(obj.cod);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeatherApiResponseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
