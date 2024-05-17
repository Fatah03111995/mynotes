// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mynotes/components/inputtext.dart';
import 'package:mynotes/data/datassource/local_datasource.dart';
import 'package:mynotes/model/note.dart';
import 'package:mynotes/pages/notes_page.dart';
import 'package:mynotes/themes/color.dart';

class NoteAddPage extends StatefulWidget {
  const NoteAddPage({super.key});

  @override
  State<NoteAddPage> createState() => _NoteAddPageState();
}

class _NoteAddPageState extends State<NoteAddPage> {
  final _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final containController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Add Your Note'),
        leading: null,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            Note note = Note(
                title: titleController.value.text,
                contain: containController.value.text,
                color: MyColors.sakura,
                createdAt: DateTime.now());
            var resDatabase =
                await LocalDatasource().insertNote(note.toMapSql());

            if (resDatabase != 0) {
              titleController.clear();
              containController.clear();
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => NotesPage()));
            }
          }
        },
        child: const Icon(Icons.check),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: ListView(
            children: [
              InputText(
                txtController: titleController,
                label: 'TITLE',
                hint: 'Your Title Note',
              ),
              InputText(
                txtController: containController,
                label: 'contain..',
                hint: 'Your Contain Note..',
                maxLine: 8,
                inputType: TextInputType.multiline,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
