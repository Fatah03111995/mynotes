import 'package:flutter/material.dart';
import 'package:mynotes/themes/textstyles.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'My Notes',
          style: TextStyles.mlBold,
        ),
      ),
      body: GridView.builder(
          itemCount: 12,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 0.8,
          ),
          itemBuilder: (context, index) {
            return const Card(
              color: Colors.red,
            );
          }),
    );
  }
}
