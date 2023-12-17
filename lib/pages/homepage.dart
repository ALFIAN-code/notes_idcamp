import 'package:flutter/material.dart';
import 'package:notes/pages/tab_all.dart';
import 'package:notes/pages/tab_highlight.dart';
import 'package:notes/pages/tab_important.dart';
import 'package:notes/style.dart';
import 'package:notes/widget/search_bar.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {

    List<Widget> tabBar = [
      const Tab(
        text: 'All',
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
        body: NestedScrollView(headerSliverBuilder: (context, innerBoxIsScrolled)=>[
          SliverAppBar(
            floating: false,
            snap: false,
            toolbarHeight: 250,
            flexibleSpace: SafeArea(
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
                    const MySearchBar(),
                    const SizedBox(
                      height: 10,
                    ),
                    TabBar(
                      unselectedLabelStyle: semibold15,
                      labelStyle: bold15,
                      unselectedLabelColor: Colors.black.withOpacity(0.5),
                      labelColor: Colors.black,
                      dividerColor: Colors.transparent,
                      indicatorColor: Colors.blue,
                      tabAlignment: TabAlignment.start,
                      isScrollable: true,
                      tabs: tabBar)
                  ],
                ),
              ),
            ),
          )
        ], body: const TabBarView(children: [
          TabAll(),
          TabHighlight(),
          TabImportant()
        ])),
      ),
    );
  }
}

// PreferredSize(
//           preferredSize: const Size.fromHeight(250),
//           child: ),