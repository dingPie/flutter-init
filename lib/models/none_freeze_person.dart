class NoneFreezePerson {
  int id;
  String name;
  int age;

  NoneFreezePerson({
    required this.id,
    required this.name,
    required this.age,
  });

  NoneFreezePerson.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int,
        name = json['name'] as String,
        age = json['age'] as int;

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'name': name,
      'age': age,
    };
  }

  NoneFreezePerson copyWith({
    int? id,
    String? name,
    int? age,
  }) {
    return NoneFreezePerson(
      id: id ?? this.id,
      name: name ?? this.name,
      age: age ?? this.age,
    );
  }

  @override
  String toString() {
    return 'NoneFreezePerson('
        'id: $id, '
        'name: $name, '
        'age: $age'
        ')';
  }

  @override
  bool operator ==(Object other) {
    return other is NoneFreezePerson &&
        id == other.id &&
        name == other.name &&
        age == other.age;
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType,
      id,
      name,
      age,
    );
  }

  get nameLength => name.length;
}
