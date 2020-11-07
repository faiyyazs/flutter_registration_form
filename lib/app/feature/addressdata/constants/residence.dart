enum ResidenceType { Select, Rumah, Kantor }

extension ParseToString on ResidenceType {
  String toShortString() {
    return this.toString().split('.').last;
  }
}
