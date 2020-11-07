enum EducationLevel { Select, SD, SMP, SMA, S1, S2, S3 }

extension ParseToString on EducationLevel {
  String toShortString() {
    return this.toString().split('.').last;
  }
}
