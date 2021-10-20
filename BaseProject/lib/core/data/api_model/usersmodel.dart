import 'package:json_annotation/json_annotation.dart';

part 'usersmodel.g.dart';

@JsonSerializable(
    checked: true,
    explicitToJson: true,
    fieldRename: FieldRename.snake,
    includeIfNull: false)
class Data {
  Data();
  int id;
  String email;
  String firstName;
  String lastName;

  @override
  List<Object> get props => [id, email, firstName, lastName];

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
  Map<String, dynamic> toMap() => {
        "id": id,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
      };
  Data.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        firstName = map['first_name'],
        lastName = map['last_name'],
        email = map['email'];
}
