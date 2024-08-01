import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_reponsive_sample/widgets/responsive/screen_extension.dart';

const double baseRatio = 16 / 9;

class ResponsiveHorizontalList extends StatelessWidget {
  const ResponsiveHorizontalList({
    super.key,
    required this.baseWidth,
    required this.baseHeight,
    required this.baseItemMargin,
    required this.itemCount,
    this.itemChild,
  });

  final double baseWidth;
  final double baseHeight;
  final double baseItemMargin;
  final Widget? itemChild;
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Calculate the scaling factor based on the aspect ratio
        double scalingFactor = context.aspectRatio / baseRatio;

        // Apply the scaling factor to the base dimensions
        double itemWidth = baseWidth / scalingFactor;
        double itemHeight = baseHeight / scalingFactor;
        double itemMargin = baseItemMargin / scalingFactor;

        debugPrint(
            'scaling Factor: $scalingFactor');

        return SizedBox(
          height: itemHeight,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: itemCount,
            separatorBuilder: (context, index) => SizedBox(width: itemMargin),
            itemBuilder: (context, index) {
              return Container(
                width: itemWidth,
                height: itemHeight,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(12.r)),
                child: itemChild,
              );
            },
          ),
        );
      },
    );
  }
}
