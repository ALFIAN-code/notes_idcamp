import 'package:flutter/material.dart';
import 'package:notes/style.dart';

class MySearchBar extends StatelessWidget {
  const MySearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      // width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: const Color(0xffF5F6FC)
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Icon(Icons.search, color: Colors.black.withOpacity(0.7),),
          ),
          Expanded(
            child: TextField(
              style: semibold15.copyWith(color: Colors.black.withOpacity(0.6)),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintStyle: semibold15.copyWith(color: Colors.black.withOpacity(0.4)),
                hintText: 'Search'
              ),
            ),
          )
        ],
      ),
    );
  }
}
