enum Direction {
  toGumi,
  toDaegu;

  static Direction fromString(String value) {
    return value == "구미 방면" ? toGumi : toDaegu;
  }

  @override
  String toString() {
    switch (this) {
      case Direction.toGumi:
        return "구미 방면";
      case Direction.toDaegu:
        return "대구 방면";
    }
  }
}
