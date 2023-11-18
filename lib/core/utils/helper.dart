class Helper {
  static List<String> convertDynamicToString(List<dynamic> l) {
    List<String> s = [];
    for (dynamic x in l) {
      s.add(x.toString());
    }
    return s;
  }
}
