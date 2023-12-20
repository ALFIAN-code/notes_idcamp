import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes/pages/notespage.dart';
import 'package:notes/widget/note_card.dart';

import '../controller/notes_controller.dart';
import '../model/note_model.dart';

class TabImportant extends StatefulWidget {
  const TabImportant({super.key});

  @override
  State<TabImportant> createState() => _TabImportantState();
}

class _TabImportantState extends State<TabImportant> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Obx(() {
            List<Note> highlightNote = notesController.getImportant();
            return ListView.builder(
                itemCount: highlightNote.length,
                itemBuilder: (context, index) {
                  return (highlightNote.isNotEmpty)
                      ? Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                          child: GestureDetector(
                              onTap: () => Get.to(() => const NotePage(),
                                  arguments: [index]),
                              child: NoteCard(note: highlightNote[index], index: index)),
                        )
                      : const Center(
                          child: Text('kosong'),
                        );
                });
          }),
        ),
      ],
    );
  }
}
