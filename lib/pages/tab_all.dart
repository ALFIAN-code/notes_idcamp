import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:notes/controller/notes_controller.dart';
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
        Expanded(child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth < 800) {
            return Obx(() => ListView.builder(
                itemCount: notesController.notes.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                    child: GestureDetector(
                        onTap: () =>
                            Get.to(() => const NotePage(), arguments: [index]),
                        child: NoteCard(
                          note: notesController.notes[index],
                          index: index,
                        )),
                  );
                }));
          } else if (constraints.maxWidth < 1300) {
            return Obx(
              () => MasonryGridView.builder(
                  gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                  itemCount: notesController.notes.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                      child: GestureDetector(
                          onTap: () => Get.to(() => const NotePage(),
                              arguments: [index]),
                          child: NoteCard(
                            note: notesController.notes[index],
                            index: index,
                          )),
                    );
                  }),
            );
          } else {
            return Obx(
              () => MasonryGridView.builder(
                  gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemCount: notesController.notes.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                      child: GestureDetector(
                          onTap: () => Get.to(() => const NotePage(),
                              arguments: [index]),
                          child: NoteCard(
                            note: notesController.notes[index],
                            index: index,
                          )),
                    );
                  }),
            );
          }
        })),
      ],
    );
  }
}
