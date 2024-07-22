import 'package:flutter/material.dart';

class RecentApp extends StatelessWidget {
  const RecentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: BoxConstraints(
            maxHeight: MediaQuery
                .sizeOf(context)
                .shortestSide * 252 / 2160),
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) => _RecentAppItem(title: 'App $index'),
          separatorBuilder: (_, __) => const SizedBox(width: 10),
          itemCount: 20,
        ));
  }
}

class _RecentAppItem extends StatelessWidget {
  const _RecentAppItem({
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery
        .sizeOf(context)
        .shortestSide * 252 / 2160;
    return Container(
      height: height,
      width: height,
      decoration: const BoxDecoration(color: Colors.blue),
      child: Center(
          child: Text(title,
              style: const TextStyle(
                fontSize: 30,
              ))),
    );
  }
}
