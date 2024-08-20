import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_responsive_sample/widgets/responsive/screen_extension.dart';

import '../widgets/responsive/responsive_horizontal_list.dart';

class MainMenuPage extends StatelessWidget {
  const MainMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    final shouldHideQCard =
        context.aspectRatio >=
            24 / 9;
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {

      const itemCount = 5;
      final baseMargin = 12.0.w;
      final baseQCardWidth =
          (context.longestSide - 40.w * 2 - baseMargin * (itemCount - 1)) /
              itemCount;
      final baseQCardHeight = baseQCardWidth / 1.8;

      return Scaffold(
          body: Padding(
        padding: const EdgeInsets.all(40.0).w,
        child: Column(children: <Widget>[
           Row(children: <Widget>[
            const Text('12:47 PM',
                style: TextStyle(fontSize: 50, color: Colors.black, fontWeight: FontWeight.bold,)),
            const Spacer(),
            const Icon(Icons.search, size: 40),
            SizedBox(width: 8.w),
            const Icon(Icons.settings, size: 40),
            SizedBox(width: 8.w),
            const Icon(Icons.close, size: 40),
          ]),
          const Spacer(),
          shouldHideQCard
              ? const SizedBox.shrink()
              : ResponsiveHorizontalList(
              baseWidth: baseQCardWidth,
              baseHeight: baseQCardHeight,
              baseItemMargin: baseMargin,
              itemCount: itemCount,
                ),
          SizedBox(height: 30.h),
          ResponsiveHorizontalList(
            baseWidth: (baseQCardWidth - baseMargin) / 2,
            baseHeight:(baseQCardWidth - baseMargin) / 2,
            baseItemMargin: baseMargin,
            itemCount: 20,
            itemChild: const Center(child: Text('App', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)))
          ),
        ]),
      ));
    });
  }
}
