class CharadesWord {
  int id;
  String word;

  CharadesWord({required this.id, required this.word});

  factory CharadesWord.fromJson(Map<String, dynamic> json) {
    return CharadesWord(id: json['id'], word: json['word']);
  }

  Map toJson() => {
        'id': id,
        'word': word,
      };
}
