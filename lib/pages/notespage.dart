import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes/controller/notes_controller.dart';
import 'package:notes/model/note_model.dart';
import 'package:notes/pages/homepage.dart';
import 'package:notes/style.dart';

class NotePage extends StatefulWidget {
  const NotePage({
    super.key,
  });

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  int index = Get.arguments[0];

  TextEditingController titleController = TextEditingController();

  TextEditingController contentController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // titleController = TextEditingController(
    //     text:
    //         (filled == true) ? notesController.notes[index].title : 'your note\'s title');
    // contentController = TextEditingController(
    //     text: (filled == true)
    //         ? notesController.notes[index].content
    //         : 'write your notes here ....');

    titleController =
        TextEditingController(text: notesController.notes[index].title);
    contentController =
        TextEditingController(text: notesController.notes[index].content);

    return Scaffold(
      backgroundColor:
          (notesController.notes[index].category == Category.uncategorized)
              ? const Color(0xffE4F4FF)
              : (notesController.notes[index].category == Category.Highlight)
                  ? const Color(0xffFFFEE4)
                  : const Color(0xffFFEEE4),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text('My Notes', style: semibold18,),
        leading: IconButton(onPressed: (){
          Get.back();
        }, icon: const Icon(Icons.arrow_back_ios_new_rounded)),
        actions: [
          IconButton(onPressed: (){
            showDialog(context: context, builder:(context){
              return AlertDialog(
                surfaceTintColor: Colors.white,
                backgroundColor: Colors.white,
                title: const Text('Are You Sure?'),
                content: const Text('Notes that have been deleted cannot be restored'),
                actions: [
                  TextButton(onPressed: (){
                    Get.back();
                  }, child: const Text('Cancel')),
                  TextButton(onPressed: (){
                    notesController.removeNote(index);
                    Get.off(const Homepage());
                  }, child: Text('Delete'))
                ],
              );
            } );
          }, icon: const Icon(Icons.delete))
        ],
      ),
      
      // PreferredSize(
      //     preferredSize: const Size.fromHeight(70),
      //     child: SafeArea(
      //       child: Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceAround,
      //         children: [
      //           IconButton(
      //             iconSize: 20,
      //             onPressed: () {
      //               Get.back();
      //             },
      //             icon: const Icon(
      //               Icons.arrow_back_ios_new_rounded,
      //             ),
      //             color: Colors.black.withOpacity(0.7),
      //           ),
      //           Expanded(
      //               flex: 9,
      //               child: Text(
      //                 'My Notes',
      //                 textAlign: TextAlign.center,
      //                 style: semibold18,
      //               )),
      //           const Expanded(flex: 2, child: SizedBox()),
      //         ],
      //       ),
      //     )),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Column(
              children: [
                TextField(
                  style: bold30,
                  controller: titleController,
                  minLines: 1,
                  maxLines: 2,
                  keyboardType: TextInputType.multiline,
                  decoration: const InputDecoration(border: InputBorder.none),
                  onChanged: (value) {
                    notesController.updateNote(
                        Note(
                            title: titleController.text,
                            content: contentController.text,
                            category: notesController.notes[index].category),
                        index);
                  },
                ),
                TextField(
                  controller: contentController,
                  maxLines: null,
                  onChanged: (value) {
                    notesController.updateNote(
                        Note(
                            title: titleController.text,
                            content: contentController.text,
                            category: notesController.notes[index].category),
                        index);
                  },
                  keyboardType: TextInputType.multiline,
                  decoration: const InputDecoration(border: InputBorder.none),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
