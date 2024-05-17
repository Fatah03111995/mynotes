import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mynotes/pages/notes_page.dart';
import 'package:mynotes/themes/textstyles.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        appBarTheme: AppBarTheme(
          color: Theme.of(context).primaryColor,
          centerTitle: true,
          titleTextStyle: TextStyles.mBold,
          titleSpacing: 1.7,
          systemOverlayStyle:
              const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
        ),
      ),
      home: NotesPage(),
    );
  }
}
