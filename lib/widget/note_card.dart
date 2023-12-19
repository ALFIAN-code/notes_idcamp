import 'package:flutter/material.dart';
import 'package:notes/model/note_model.dart';
import 'package:notes/style.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({super.key, required this.note});
  final Note note;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 100,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      decoration: BoxDecoration(
        color: (note.category.name == 'uncategorized')?const Color(0xffE4F4FF):(note.category.name == 'Highlight')?const Color(0xffFFFEE4):const Color(0xffFFEEE4),
        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20), topRight: Radius.circular(20))
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(note.title, maxLines: 2,style: semibold15.copyWith(color: const Color(0xff494949)),),
          const SizedBox(
            height: 5,
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
                  child: Text(note.category.name, style: medium15.copyWith(fontSize: 11, color: Color.fromARGB(255, 124, 124, 124)),),
                ),
              ),
              const SizedBox(width: 10,),
            ],
          )
        ],
      ),
    );
  }
}