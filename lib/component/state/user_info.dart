class UserInfo {
  String name;
  int age;

  UserInfo({required this.name, required this.age});

  @override
  bool operator ==(Object other) {
    if (other is UserInfo) {
      return name == other.name && age == other.age;
    } else {
      return false;
    }
  }
}
