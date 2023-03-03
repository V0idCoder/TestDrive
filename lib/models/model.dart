class Model {
  final String idModel;
  final String strModel;
  final String linkModel;

  Model(
    this.idModel,
    this.strModel,
    this.linkModel,
  );

  factory Model.fromJson(Map<String, dynamic> json) {
    return Model(
      json['idModel'] as String,
      json['strModel'] as String,
      json['linkModel'] as String,
    );
  }
}
