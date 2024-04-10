class NamesModel {
  int id;
  String name;

  NamesModel({required this.id, required this.name});

  factory NamesModel.fromJson(Map<String, dynamic> json) {
    return NamesModel(id: json['id'], name: json['name']);
  }

  Map toJson() => {
        'id': id,
        'name': name,
      };
}
