class Category {
  final String idCategory;
  final String strCategory;
  final String linkCategory;
  final String screen;

  Category(
    this.idCategory,
    this.strCategory,
    this.linkCategory,
    this.screen,
  );

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      json['idCategory'] as String,
      json['strCategory'] as String,
      json['linkCategory'] as String,
      json['screen'] as String,
    );
  }
}
