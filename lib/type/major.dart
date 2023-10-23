enum Major {
  computer,
  software,
  electronic,
  driver;

  static Major fromString(String value) {
    switch(value) {
      case "컴퓨터공학과":
        return Major.computer;
      case "컴퓨터소프트웨어공학과":
        return Major.software;
      case "전자공학과":
        return Major.electronic;
    }
    return Major.driver;
  }

  @override
  String toString() {
    switch (this) {
      case Major.computer:
        return "컴퓨터공학과";
      case Major.software:
        return "컴퓨터소프트웨어공학과";
      case Major.electronic:
        return "전자공학과";
      case Major.driver:
        return "버스 기사";
    }
  }
}
