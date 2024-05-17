import 'package:flutter/material.dart';
import 'package:mynotes/data/datassource/local_datasource.dart';
import 'package:mynotes/model/note.dart';
import 'package:mynotes/pages/noteedit_page.dart';
import 'package:mynotes/themes/textstyles.dart';

class NoteDetailPage extends StatefulWidget {
  final Note note;
  const NoteDetailPage({super.key, required this.note});

  @override
  State<NoteDetailPage> createState() => _NoteDetailPageState();
}

class _NoteDetailPageState extends State<NoteDetailPage> {
  late Note note;

  void updateData() async {
    note.mark = !note.mark;
    int resp = await LocalDatasource().updateNoteById(note.toMapSql());
    if (resp != 0) {
      getNotes(note.id!);
    }
  }

  Future<void> getNotes(int id) async {
    var notes = await LocalDatasource().getNote(id);
    setState(() {
      note = notes;
    });
  }

  @override
  Widget build(BuildContext context) {
    note = widget.note;
    return Scaffold(
      appBar: AppBar(
        leading: null,
        title: const Text('Detail Page'),
      ),
      body: Stack(
        children: [
          Card(
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
          Positioned(
              top: 20,
              right: 20,
              child: IconButton.filled(
                  onPressed: () {
                    updateData();
                  },
                  icon: Icon(
                      note.mark ? Icons.bookmark : Icons.bookmark_border))),
        ],
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
