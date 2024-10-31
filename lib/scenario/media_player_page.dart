import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_responsive_sample/widgets/responsive/screen_extension.dart';

import '../constant.dart';
import '../widgets/responsive/responsive_grid_view.dart';
import '../widgets/responsive/responsive_two_dimension_table.dart';

class MediaPlayerPage extends StatelessWidget {
  const MediaPlayerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double tabMenuWidth = context.isPortrait ? 252 : 331;
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(40.0).w,
      child: Column(children: <Widget>[
        Row(children: <Widget>[
          const Text('Media Player',
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
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                  color: Colors.orangeAccent[100],
                  width: tabMenuWidth,
                  padding: EdgeInsets.all(40.w),
                  child:
                      Wrap(direction: Axis.vertical, spacing: 20.h, children: [
                    Text('Tab', style: TextStyle(fontSize: 40)),
                    Text('Tab', style: TextStyle(fontSize: 40)),
                  ])),
              SizedBox(width: 50.w),
              Expanded(
                child: LayoutBuilder(builder: (context, constraints) {
                  const itemCount = 5;
                  final baseMargin = 10.0.w;

                  final longestSide = context.isPortrait
                      ? (constraints.maxHeight - tabMenuWidth)
                      : constraints.maxWidth;
                  final baseQCardWidth =
                      (longestSide - baseMargin * itemCount) / itemCount;
                  final baseQCardHeight = baseQCardWidth;

                  return ResponsiveTwoDimensionTable(
                    baseWidth: baseQCardWidth,
                    baseHeight: baseQCardHeight,
                    baseItemMargin: baseMargin,
                    columnCount: 10,
                    rowCount: 10,
                    itemChild: const Center(
                        child: Text('App',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold))),
                  );
                }),
              ),
            ],
          ),
        ),
      ]),
    ));
  }
}
