import 'package:flutter/material.dart';
import 'package:mynotes/data/datassource/local_datasource.dart';
import 'package:mynotes/model/note.dart';
import 'package:mynotes/pages/noteadd_page.dart';
import 'package:mynotes/pages/notedetail_page.dart';
import 'package:mynotes/themes/textstyles.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  List<Note> note = [];

  void updateData(int index) async {
    note[index].mark = !note[index].mark;
    int resp = await LocalDatasource().updateNoteById(note[index].toMapSql());
    if (resp != 0) {
      getNotes();
    }
  }

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
        leading: null,
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
            childAspectRatio: 0.6,
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
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
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
                          Text(
                            note[index].contain,
                            style: TextStyles.notesContain,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton.filled(
                              onPressed: () {
                                updateData(index);
                              },
                              icon: Icon(note[index].mark
                                  ? Icons.bookmark
                                  : Icons.bookmark_border)),
                          IconButton.filled(
                              onPressed: () {
                                LocalDatasource()
                                    .deleteNoteById(note[index].id!);
                                getNotes();
                              },
                              icon: const Icon(Icons.delete)),
                        ],
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
