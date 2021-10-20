import 'package:json_annotation/json_annotation.dart';

part 'message.g.dart';

@JsonSerializable(
    checked: true,
    explicitToJson: true,
    fieldRename: FieldRename.snake,
    includeIfNull: false)
class Message {
  String text;
  DateTime date;

  Message({this.text, this.date});
  @override
  List<Object> get props => [text, date];
  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);
  Map<String, dynamic> toJson() => _$MessageToJson(this);
}
