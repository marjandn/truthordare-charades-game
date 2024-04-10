class TruthModel {
  int id;
  String content;

  TruthModel({required this.id, required this.content});

  factory TruthModel.fromJson(Map<String, dynamic> json) {
    return TruthModel(id: json['id'], content: json['content']);
  }

  Map toJson() => {
        'id': id,
        'content': content,
      };
}
