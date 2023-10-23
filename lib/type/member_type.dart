enum MemberType {
  member, driver;

  static MemberType fromString(String value) {
    return value == "학생" ? member : driver;
  }

  @override
  String toString() {
    switch (this) {
      case MemberType.member:
        return "학생";
      case MemberType.driver:
        return "버스 기사";
    }
  }
}