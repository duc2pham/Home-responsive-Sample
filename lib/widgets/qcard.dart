import 'package:flutter/material.dart';

const mockQCard = [
  'Sports',
  'Learning',
  'Games',
  'Music',
  'Home',
  'Accessibility',
];

class QCard extends StatelessWidget {
  const QCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: BoxConstraints(
            maxHeight: MediaQuery.sizeOf(context).shortestSide * 180 / 2160),
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) => _QcardItem(title: mockQCard[index]),
          separatorBuilder: (_, __) => const SizedBox(width: 10),
          itemCount: mockQCard.length,
        ));
  }
}

class _QcardItem extends StatelessWidget {
  const _QcardItem({
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).shortestSide * 180 / 2160;
    final width = height * 816 / 180;
    return Container(
        width: width,
        height: height,
        color: Colors.green,
        child: Center(
            child: Text(title,
                style: const TextStyle(
                  fontSize: 30,
                ))));
  }
}
