// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

class Note {
  final int? id;
  final String title;
  final String contain;
  bool mark;
  // final List tag; // NEXT DEVELOPMENT, HOW TO INPUT ARRAY TO SQLs
  final Color color;
  final DateTime? createdAt;
  final DateTime? editedAt;

  Note({
    required this.title,
    required this.contain,
    this.id,
    this.mark = false,
    // this.tag = const ['contoh1', 'contoh2'],
    this.color = Colors.white,
    this.createdAt,
    this.editedAt,
  });

  Map<String, dynamic> toMapSql() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'contain': contain,
      'mark': mark ? 1 : 0, // boolean in sql are only 1 or 0
      // 'tag': tag.toList(),
      'color': color.value,
      'createdAt': createdAt?.millisecondsSinceEpoch,
      'editedAt': editedAt?.millisecondsSinceEpoch,
    };
  }

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      id: map['id'] != null ? map['id'] as int : null,
      title: map['title'] as String,
      contain: map['contain'] as String,
      mark: map['mark'] == 1 ? true : false,
      // tag: List.from((map['tag'] as List)),
      color: Color(map['color'] as int),
      createdAt: map['createdAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int)
          : null,
      editedAt: map['editedAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['editedAt'] as int)
          : null,
    );
  }

  String toJson() => json.encode(toMapSql());

  factory Note.fromJson(String source) =>
      Note.fromMap(json.decode(source) as Map<String, dynamic>);
}
