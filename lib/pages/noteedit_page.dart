import 'package:flutter/material.dart';
import 'package:mynotes/components/inputtext.dart';
import 'package:mynotes/data/datassource/local_datasource.dart';
import 'package:mynotes/model/note.dart';
import 'package:mynotes/pages/notes_page.dart';

class NoteEditPage extends StatefulWidget {
  final Note note;
  const NoteEditPage({super.key, required this.note});

  @override
  State<NoteEditPage> createState() => _NoteEditPageState();
}

class _NoteEditPageState extends State<NoteEditPage> {
  final _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final containController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Note note = widget.note;
    titleController.value = TextEditingValue(text: note.title);
    containController.value = TextEditingValue(text: note.contain);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Your Note'),
        automaticallyImplyLeading: false,
        leading: null,
      ),
      backgroundColor: note.color,
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Stack(
            children: [
              ListView(
                children: [
                  InputText(
                    txtController: titleController,
                    hint: 'Your Title Note',
                  ),
                  InputText(
                    txtController: containController,
                    hint: 'Your Contain Note..',
                    maxLine: 8,
                    inputType: TextInputType.multiline,
                  ),
                ],
              ),
              Positioned(
                bottom: 20,
                right: 20,
                child: FloatingActionButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      Note sendNote = Note(
                          id: note.id,
                          title: titleController.value.text,
                          contain: containController.value.text,
                          mark: note.mark,
                          color: note.color,
                          createdAt: note.createdAt,
                          editedAt: DateTime.now());
                      var resDatabase = await LocalDatasource()
                          .updateNoteById(sendNote.toMapSql());

                      if (resDatabase != 0) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NotesPage()));
                      }
                    }
                  },
                  child: const Icon(Icons.check),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
