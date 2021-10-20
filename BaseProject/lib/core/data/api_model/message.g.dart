// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Message _$MessageFromJson(Map<String, dynamic> json) {
  return $checkedNew('Message', json, () {
    final val = Message(
      text: $checkedConvert(json, 'text', (v) => v as String),
      date: $checkedConvert(
          json, 'date', (v) => v == null ? null : DateTime.parse(v as String)),
    );
    return val;
  });
}

Map<String, dynamic> _$MessageToJson(Message instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('text', instance.text);
  writeNotNull('date', instance.date?.toIso8601String());
  return val;
}
