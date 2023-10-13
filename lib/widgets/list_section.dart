import 'package:flutter/material.dart';

class ListSection extends StatelessWidget {
  String title;
  Widget widget;

  ListSection({super.key, required this.title, required this.widget});


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.titleLarge),
        const Padding(padding: EdgeInsets.only(bottom: 10)),
        widget
      ],
    );
  }
}