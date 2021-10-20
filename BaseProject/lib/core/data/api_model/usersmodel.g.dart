// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usersmodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) {
  return $checkedNew('Data', json, () {
    final val = Data();
    $checkedConvert(json, 'id', (v) => val.id = v as int);
    $checkedConvert(json, 'email', (v) => val.email = v as String);
    $checkedConvert(json, 'first_name', (v) => val.firstName = v as String);
    $checkedConvert(json, 'last_name', (v) => val.lastName = v as String);
    return val;
  }, fieldKeyMap: const {'firstName': 'first_name', 'lastName': 'last_name'});
}

Map<String, dynamic> _$DataToJson(Data instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('email', instance.email);
  writeNotNull('first_name', instance.firstName);
  writeNotNull('last_name', instance.lastName);
  return val;
}
