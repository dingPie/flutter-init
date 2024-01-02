import 'package:freezed_annotation/freezed_annotation.dart';

part 'person.freezed.dart';
part 'person.g.dart';

@freezed
class Person with _$Person {
  // constructor 및 본인을 반환하는 factory를 만들어주는 기본 문법
  factory Person({
    required int id,
    required String name,
    required int age,
  }) = _Person;

  // json 확장
  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);

  // 메소드나 custom getter 작성시 필수로 추가, 새로 build 해야 함.
  Person._();

  get nameLength => name.length;
}
