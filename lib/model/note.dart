import 'package:flutter/material.dart';

class Note {
  String title;
  String contain;
  List tag;
  Color color;
  DateTime? timeStamp;

  Note(
      {required this.title,
      required this.contain,
      this.tag = const [],
      this.color = Colors.white,
      this.timeStamp});
}
