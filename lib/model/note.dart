import 'package:flutter/material.dart';

class Note {
  String title;
  String contain;
  bool mark;
  List tag;
  Color color;
  DateTime? timeStamp;

  Note(
      {required this.title,
      required this.contain,
      this.mark = false,
      this.tag = const [],
      this.color = Colors.white,
      this.timeStamp});
}
