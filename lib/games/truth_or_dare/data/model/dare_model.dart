class DareModel {
  int id;
  String content;

  DareModel({required this.id, required this.content});

  factory DareModel.fromJson(Map<String, dynamic> json) {
    return DareModel(id: json['id'], content: json['content']);
  }

  Map toJson() => {
        'id': id,
        'content': content,
      };
}
