import 'package:flutter/material.dart';
import 'package:mynotes/model/note.dart';
import 'package:mynotes/pages/noteedit_page.dart';
import 'package:mynotes/themes/color.dart';
import 'package:mynotes/themes/textstyles.dart';

class NoteDetailPage extends StatefulWidget {
  final Note note;
  const NoteDetailPage({super.key, required this.note});

  @override
  State<NoteDetailPage> createState() => _NoteDetailPageState();
}

class _NoteDetailPageState extends State<NoteDetailPage> {
  @override
  Widget build(BuildContext context) {
    final Note note = widget.note;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Page'),
      ),
      body: Card(
        color: note.color,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  note.title,
                  style: TextStyles.noteTitleDetail,
                  textAlign: TextAlign.center,
                ),
              ),
              Divider(
                thickness: 3,
                height: 30,
                color: Colors.white.withOpacity(0.7),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  note.contain,
                  style: TextStyles.noteContainDetail,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start,
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => NoteEditPage(note: note)));
        },
        child: const Icon(Icons.edit),
      ),
    );
  }
}
