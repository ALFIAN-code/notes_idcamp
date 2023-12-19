import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:notes/controller/notes_controller.dart';
import 'package:notes/model/note_model.dart';
import 'package:notes/pages/notespage.dart';
import 'package:notes/widget/note_card.dart';

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
            itemBuilder: (context, index){
              return Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                child: GestureDetector(
                  onTap: ()=> Get.to(()=>const NotePage()),
                  child: NoteCard(note: notesController.notes[index])),
              );
            })),
        ),
      ],
    );
    }
}