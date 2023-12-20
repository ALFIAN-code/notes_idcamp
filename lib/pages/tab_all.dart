import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes/controller/notes_controller.dart';
import 'package:notes/pages/notespage.dart';
import 'package:notes/widget/note_card.dart';
import 'package:notes/widget/popup_menu.dart';

class TabAll extends StatefulWidget {
  const TabAll({super.key});

  @override
  State<TabAll> createState() => _TabAllState();
}

class _TabAllState extends State<TabAll> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Obx(() => ListView.builder(
              itemCount: notesController.notes.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                  child: GestureDetector(
                      // onLongPress: () {
                      //   showDialog(
                      //     barrierColor: Colors.black.withOpacity(0.1),
                      //     context: context, builder: (context)=>PopupMenu(index: index)
                      //     );
                      // },
                      onTap: () => Get.to(() => const NotePage(),
                          arguments: [index]),
                      child: NoteCard(note: notesController.notes[index], index: index,)),
                );
              })),
        ),
      ],
    );
  }
}
