class ConvertedSimpleObject {
  const ConvertedSimpleObject({
    this.aString,
    this.anInt,
    this.aDouble
  });

  final String aString;
  final int anInt;
  final double aDouble;

  factory ConvertedSimpleObject.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;

    return ConvertedSimpleObject(
      aString: json['aString'] as String,
      anInt: json['anInt'] as int,
      aDouble: json['aDouble'] as double,
    );
  }
}
