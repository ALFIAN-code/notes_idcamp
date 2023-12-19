import 'package:flutter/foundation.dart';

class Note{
  String title;
  String content;
  Category category;

  Note({required this.title, required this.content, required this.category});
}

enum Category{Highlight, Important, uncategorized }