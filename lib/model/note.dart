// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

class Note {
  String title;
  String contain;
  bool mark;
  List tag;
  Color color;
  DateTime? createdAt;
  DateTime? editedAt;

  Note({
    required this.title,
    required this.contain,
    this.mark = false,
    this.tag = const [],
    this.color = Colors.white,
    this.createdAt,
    this.editedAt,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'contain': contain,
      'mark': mark,
      'tag': tag,
      'color': color.value,
      'createdAt': createdAt?.millisecondsSinceEpoch,
      'editedAt': editedAt?.millisecondsSinceEpoch,
    };
  }

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      title: map['title'] as String,
      contain: map['contain'] as String,
      mark: map['mark'] as bool,
      tag: List.from((map['tag'] as List)),
      color: Color(map['color'] as int),
      createdAt: map['createdAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(int.parse(map['createdAt']))
          : null,
      editedAt: map['editedAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(int.parse(map['editedAt']))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Note.fromJson(String source) =>
      Note.fromMap(json.decode(source) as Map<String, dynamic>);
}
