import 'package:flutter/material.dart';

class Shelf extends StatelessWidget {
  const Shelf({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: BoxConstraints(
            maxHeight: MediaQuery
                .sizeOf(context)
                .shortestSide * 454 / 2160),
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) => _ShelfItem(title: 'Shelf $index'),
          separatorBuilder: (_, __) => const SizedBox(width: 10),
          itemCount: 20,
        ));
  }
  }

class _ShelfItem extends StatelessWidget {
  const _ShelfItem({
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery
        .sizeOf(context)
        .shortestSide * 454 / 2160;
    return Container(
      height: height,
      decoration: const BoxDecoration(color: Colors.cyan),
      child: AspectRatio(
        aspectRatio: 7/4,
        child: Center(
            child: Text(title,
                style: const TextStyle(
                  fontSize: 30,
                ))),
      ),
    );
  }
}
