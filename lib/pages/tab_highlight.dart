import 'package:flutter/material.dart';

class TabHighlight extends StatefulWidget {
  const TabHighlight({super.key});

  @override
  State<TabHighlight> createState() => _TabHighlightState();
}

class _TabHighlightState extends State<TabHighlight> {
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Text('TAB HIGHLIGHT'),
    );
  }
}