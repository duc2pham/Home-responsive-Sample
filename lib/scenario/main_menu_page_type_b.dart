import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_responsive_sample/widgets/responsive/responsive_grid_view.dart';
import 'package:home_responsive_sample/widgets/responsive/screen_extension.dart';

import '../constant.dart';

class MainMenuPageTypeB extends StatelessWidget {
  const MainMenuPageTypeB({super.key});

  @override
  Widget build(BuildContext context) {
    final shouldHideQCard = context.aspectRatio >= 24 / 9;
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      const itemCount =  4;
      const itemAppCount =  8;

      final baseMargin = 12.0.w;
      final baseQCardWidth =
          (context.longestSide - 40.w * 2 - baseMargin * (itemCount - 1)) /
              itemCount;
      final baseQCardHeight = baseQCardWidth / 1.8;

      // Calculate the scaling factor based on the aspect ratio
      double scalingFactor = context.aspectRatio / baseRatio;
      double itemMargin = baseMargin / scalingFactor;

      return Scaffold(
          body: Padding(
        padding: const EdgeInsets.all(40.0).w,
        child: Column(children: <Widget>[
          Row(children: <Widget>[
            const Text('12:47 PM',
                style: TextStyle(
                  fontSize: 50,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                )),
            const Spacer(),
            const Icon(Icons.search, size: 40),
            SizedBox(width: 8.w),
            const Icon(Icons.settings, size: 40),
            SizedBox(width: 8.w),
            const Icon(Icons.close, size: 40),
          ]),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                shouldHideQCard
                    ? const SizedBox.shrink()
                    : ResponsiveGridView(
                        baseWidth: baseQCardWidth,
                        baseHeight: baseQCardHeight,
                        baseItemMargin: baseMargin,
                        itemCount: itemCount,
                        crossAxisCount: context.isPortrait ? itemCount ~/2 : itemCount,
                      ),
                SizedBox(height: 30.h),
                ResponsiveGridView(
                  baseWidth: (baseQCardWidth - itemMargin) / 2,
                  baseHeight: (baseQCardWidth - itemMargin) / 2,
                  baseItemMargin: baseMargin,
                  itemCount: shouldHideQCard ? itemAppCount : itemAppCount * 2,
                  itemChild: const Center(
                      child: Text('App',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold))),
                  crossAxisCount: context.isPortrait ? itemAppCount ~/ 2 : itemAppCount,
                ),
              ],
            ),
          ),
        ]),
      ));
    });
  }
}
