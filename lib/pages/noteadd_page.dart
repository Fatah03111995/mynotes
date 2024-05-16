import 'package:flutter/material.dart';
import 'package:mynotes/components/inputtext.dart';
import 'package:mynotes/model/note.dart';

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
        title: const Text('Add Your Note'),
        leading: null,
      ),
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
              Positioned(
                bottom: 20,
                right: 20,
                child: FloatingActionButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Note(
                          title: titleController.value.text,
                          contain: containController.value.text);
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
