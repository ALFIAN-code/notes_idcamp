import 'package:flutter/material.dart';
import 'package:notes/style.dart';
import 'package:notes/widget/search_bar.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(250),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 40, 20, 10),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Hey Alfian', style: semibold18),
                          Text('Good Morning', style: semibold18)
                        ],
                      ),
                      Container(
                        height: 45,
                        width: 45,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                            // color: Colors.grey,
                            borderRadius: BorderRadius.circular(12)),
                          child: Image.asset('lib/assets/user.jpg'),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const MySearchBar()
                ],
              ),
            ),
          )),
    );
  }
}
