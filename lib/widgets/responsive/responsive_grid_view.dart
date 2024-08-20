import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_responsive_sample/widgets/responsive/screen_extension.dart';

import '../../constant.dart';

class ResponsiveGridView extends StatelessWidget {
  const ResponsiveGridView({
    super.key,
    required this.baseWidth,
    required this.baseHeight,
    required this.baseItemMargin,
    required this.itemCount,
    required this.crossAxisCount,
    this.itemChild,
  });

  final double baseWidth;
  final double baseHeight;
  final double baseItemMargin;
  final Widget? itemChild;
  final int itemCount;
  final int crossAxisCount;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      // Calculate the scaling factor based on the aspect ratio
      double scalingFactor = context.aspectRatio / baseRatio;

      // Apply the scaling factor to the base dimensions
      double itemWidth = baseWidth / scalingFactor;
      double itemHeight = baseHeight / scalingFactor;
      double itemMargin = baseItemMargin / scalingFactor;

      int numOfRows = itemCount ~/ crossAxisCount;

      return Table(
          defaultColumnWidth: FixedColumnWidth(itemWidth+ itemMargin),
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: List.generate(
              numOfRows,
              (index) => TableRow(
                  children: List.generate(
                      crossAxisCount,
                      (index) => Container(
                            width: itemWidth,
                            height: itemHeight,
                            margin: EdgeInsets.only(
                              right:
                                  index == crossAxisCount - 1 ? 0 : itemMargin,
                              bottom: itemMargin,
                            ),
                            decoration: BoxDecoration(
                                color: Colors.teal[200],
                                borderRadius: BorderRadius.circular(12.r)),
                            child: itemChild,
                          )))));
    });
  }
}
