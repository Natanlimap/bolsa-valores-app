class Enterprise {
  String shortName;
  String fullName;
  double price;
  double dayVariation;
  String code;

  Enterprise(
      {required this.code,
      required this.shortName,
      required this.fullName,
      required this.price,
      required this.dayVariation});

  @override
  String toString() {
    return this.shortName +
        " " +
        this.fullName +
        " " +
        this.price.toString() +
        " " +
        this.dayVariation.toString();
  }
}
