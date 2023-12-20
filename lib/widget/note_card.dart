import 'package:flutter/material.dart';
import 'package:notes/model/note_model.dart';
import 'package:notes/style.dart';
import 'package:notes/widget/popup_menu.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({super.key, required this.note, required this.index});
  final Note note;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 100,
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(30, 5, 30, 15),
      decoration: BoxDecoration(
        color: (note.category == Category.uncategorized)?const Color(0xffE4F4FF):(note.category == Category.Highlight)?const Color(0xffFFFEE4):const Color(0xffFFEEE4),
        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20), topRight: Radius.circular(20))
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(note.title, maxLines: 2,style: semibold18.copyWith(color: const Color(0xff494949)),),
              IconButton(onPressed: (){
                showDialog(
                          barrierColor: Colors.black.withOpacity(0.1),
                          context: context, builder: (context)=>PopupMenu(index: index,)
                          );
              }, icon: const Icon(Icons.more_vert), iconSize: 20,color: Colors.black.withOpacity(0.7),)
            ],
          ),
          Text(note.content, maxLines: 4,overflow: TextOverflow.ellipsis, style: medium15.copyWith(color: const Color(0xff494949).withOpacity(0.72), fontSize: 11),),
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(7),
                  border: Border.all(color: Colors.black.withOpacity(0.08))
                ),
                child: Center(
                  child: Text(note.category.name, style: medium15.copyWith(fontSize: 11, color: const Color.fromARGB(255, 124, 124, 124)),),
                ),
              ),
              // const SizedBox(width: 10,),
            ],
          )
        ],
      ),
    );
  }
}