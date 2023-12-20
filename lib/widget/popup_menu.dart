import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes/controller/notes_controller.dart';
import 'package:notes/model/note_model.dart';
import 'package:notes/style.dart';

class PopupMenu extends StatelessWidget {
  const PopupMenu({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        width: 70,
        height: 180,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(15)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () {
                Note noteData = notesController.notes[index];
                noteData.category = Category.uncategorized;
                notesController.updateNote(noteData, index);
                Get.back();
              },
              child: const PupupItem(
                color: Color(0xffE4F4FF),
                name: 'uncategorized',
              ),
            ),
            GestureDetector(
                onTap: () {
                  Note noteData = notesController.notes[index];
                  noteData.category = Category.Highlight;
                  notesController.updateNote(noteData, index);
                  Get.back();
                },
                child: const PupupItem(
                    color: Color(0xffFFFEE4), name: 'Highlight')),
            GestureDetector(
                onTap: () {
                  Note noteData = notesController.notes[index];
                  noteData.category = Category.Important;
                  notesController.updateNote(noteData, index);
                  Get.back();
                },
                child: const PupupItem(
                    color: Color(0xffFFEEE4), name: 'Important'))
          ],
        ),
      ),
    );
  }
}

class PupupItem extends StatelessWidget {
  const PupupItem({super.key, required this.color, required this.name});

  final Color color;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.black.withOpacity(0.3))),
      child: Center(
        child: Text(
          name,
          style: medium15.copyWith(color: Colors.black.withOpacity(0.6)),
        ),
      ),
    );
  }
}
