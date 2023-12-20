import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes/controller/notes_controller.dart';
import 'package:notes/model/note_model.dart';
import 'package:notes/pages/notespage.dart';
import 'package:notes/widget/note_card.dart';

class TabHighlight extends StatefulWidget {
  const TabHighlight({super.key});

  @override
  State<TabHighlight> createState() => _TabHighlightState();
}

class _TabHighlightState extends State<TabHighlight> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Obx(() {
            List<Note> highlightNote = notesController.getHighlight();
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
                          child: Text('tidak ada highlight'),
                        );
                });
          }),
        ),
      ],
    );
  }
}
