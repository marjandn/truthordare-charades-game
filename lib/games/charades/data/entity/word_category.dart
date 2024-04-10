import 'package:flutter/material.dart';

class WordCategory {
  final int categoryId;
  final String categoryName;
  final List<String> categoryWords;
  final String iconPath;
  final Color itemColor;

  const WordCategory(
      {required this.categoryId,
      required this.categoryName,
      required this.categoryWords,
      required this.iconPath,
      required this.itemColor});
}
