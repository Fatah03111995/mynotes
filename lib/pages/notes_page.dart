import 'package:flutter/material.dart';
import 'package:mynotes/data/datassource/local_datasource.dart';
import 'package:mynotes/model/note.dart';
import 'package:mynotes/pages/noteadd_page.dart';
import 'package:mynotes/pages/notedetail_page.dart';
import 'package:mynotes/themes/color.dart';
import 'package:mynotes/themes/textstyles.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  List<Note> note = [];

  Future<void> getNotes() async {
    var notes = await LocalDatasource().getNotes();
    setState(() {
      note = notes;
    });
  }

  @override
  void initState() {
    super.initState();
    getNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'My Notes',
        ),
      ),
      body: GridView.builder(
          itemCount: note.length,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 0.8,
          ),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NoteDetailPage(note: note[index]),
                  ),
                )
              },
              child: Card(
                color: note[index].color,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Text(
                        note[index].title,
                        style: TextStyles.notesTitle,
                        textAlign: TextAlign.center,
                      ),
                      Divider(
                        thickness: 3,
                        height: 10,
                        color: Colors.white.withOpacity(0.7),
                      ),
                      Flexible(
                        child: Text(
                          note[index].contain,
                          style: TextStyles.notesContain,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.start,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => NoteAddPage()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
