class Brand {
  final String idBrand;
  final String strBrand;
  final String linkBrand;
  final String choice1;
  final String choice2;
  final String choice3;
  final String choice4;

  Brand(this.idBrand, this.strBrand, this.linkBrand, this.choice1, this.choice2,
      this.choice3, this.choice4);

  factory Brand.fromJson(Map<String, dynamic> json) {
    return Brand(
      json['idBrand'] as String,
      json['strBrand'] as String,
      json['linkBrand'] as String,
      json['choice1'] as String,
      json['choice2'] as String,
      json['choice3'] as String,
      json['choice4'] as String,
    );
  }
}
