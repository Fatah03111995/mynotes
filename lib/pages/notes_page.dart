import 'package:flutter/material.dart';
import 'package:mynotes/pages/noteadd_page.dart';
import 'package:mynotes/themes/color.dart';
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
        title: const Text(
          'My Notes',
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
            return Card(
              color: MyColors.yellow,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  children: [
                    Text(
                      'Sample Title',
                      style: TextStyles.notesTitleDetail,
                    ),
                    Divider(
                      thickness: 2,
                      height: 5,
                      color: Colors.white.withOpacity(0.7),
                    ),
                    Flexible(
                      child: Text(
                        'Sample Contaiiiiiiiiiiiiiiiiiiiiiii smsmsmsm\nxdsfddddddddddsdcdf\nsadfasdf\nsdfd\nsdf\ndgdnd\ndsfsfsfsadf\nadfasdfasdfasfsadf',
                        style: TextStyles.notesContain,
                      ),
                    )
                  ],
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
