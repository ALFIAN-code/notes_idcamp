import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes/controller/notes_controller.dart';
import 'package:notes/model/note_model.dart';
import 'package:notes/pages/notespage.dart';
import 'package:notes/pages/tab_all.dart';
import 'package:notes/pages/tab_highlight.dart';
import 'package:notes/pages/tab_important.dart';
import 'package:notes/style.dart';
import 'package:notes/widget/popup_menu.dart';
import 'package:notes/widget/search_bar.dart';
import 'package:popover/popover.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> tabBar = [
      const Tab(
        text: 'All Notes',
      ),
      const Tab(
        text: 'Highlight',
      ),
      const Tab(
        text: 'Important',
      )
    ];

    return DefaultTabController(
      length: tabBar.length,
      child: Scaffold(
        body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
                  SliverAppBar(
                    floating: false,
                    snap: false,
                    toolbarHeight: 220,
                    flexibleSpace: SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Hey Alfian', style: semibold20),
                                    Text('Good Morning', style: semibold20)
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
                            const MySearchBar(),
                            const SizedBox(
                              height: 10,
                            ),
                            TabBar(
                                unselectedLabelStyle: semibold15,
                                labelStyle: bold15,
                                unselectedLabelColor:
                                    Colors.black.withOpacity(0.5),
                                labelColor: Colors.black,
                                dividerColor: Colors.transparent,
                                indicatorColor: Colors.blue.shade100,
                                indicatorSize: TabBarIndicatorSize.label,
                                indicator: BoxDecoration(
                                    border: Border(
                                  bottom: BorderSide(
                                      color: Colors.blue.shade100, width: 3),
                                )),
                                tabAlignment: TabAlignment.start,
                                isScrollable: true,
                                tabs: tabBar)
                          ],
                        ),
                      ),
                    ),
                  )
                ],
            body: const Padding(
              padding: EdgeInsets.only(top: 20),
              child: TabBarView(
                  children: [TabAll(), TabHighlight(), TabImportant()]),
            )),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            notesController.addNote(Note(
                title: 'your note\'s title',
                content: 'write your notes here ....',
                category: Category.uncategorized));
            Get.to(const NotePage(),
                arguments: [notesController.notes.length - 1]);
          },
          backgroundColor: Colors.blue.shade100.withOpacity(0.8),
          elevation: 1,
          shape: const CircleBorder(),
          child: const Icon(
            Icons.add_rounded,
            color: Colors.white,
            size: 40,
          ),
        ),
      ),
    );
  }
}

// PreferredSize(
//           preferredSize: const Size.fromHeight(250),
//           child: ),