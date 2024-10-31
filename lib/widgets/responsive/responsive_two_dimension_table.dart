import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_responsive_sample/widgets/responsive/screen_extension.dart';
import 'dart:math' as math;

import '../../constant.dart';

class ResponsiveTwoDimensionTable extends StatelessWidget {
  const ResponsiveTwoDimensionTable({
    super.key,
    required this.baseWidth,
    required this.baseHeight,
    required this.baseItemMargin,
    required this.columnCount,
    required this.rowCount,
    this.itemChild,
  });

  final double baseWidth;
  final double baseHeight;
  final double baseItemMargin;
  final Widget? itemChild;
  final int columnCount;
  final int rowCount;

  @override
  Widget build(BuildContext context) {
    final shouldIgnoreScalingFactor = context.aspectRatio >= 24/9;
    return LayoutBuilder(builder: (context, constraint) {
      // Calculate the scaling factor based on the aspect ratio
      double scalingFactor = shouldIgnoreScalingFactor ? 1 : context.aspectRatio / baseRatio;

      // Apply the scaling factor to the base dimensions
      double itemWidth = baseWidth / scalingFactor;
      double itemHeight = baseHeight / scalingFactor;
      double itemMargin = baseItemMargin / scalingFactor;

      return TwoDimensionalGridView(
        key: Key(context.isPortrait.toString()),
          diagonalDragBehavior: DiagonalDragBehavior.free,
          itemWidth: itemWidth + itemMargin,
          itemHeight: itemHeight + itemMargin,
          delegate: TwoDimensionalChildBuilderDelegate(
              maxXIndex: columnCount,
              maxYIndex: rowCount,
              builder: (BuildContext _, ChildVicinity vicinity) {
                return Container(
                  width: itemWidth + itemMargin,
                  height: itemHeight + itemMargin,
                  padding: EdgeInsets.only(
                    right: itemMargin,
                    bottom: itemMargin,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.teal[200],
                        borderRadius: BorderRadius.circular(12.r)),
                    child: itemChild,
                  ),
                );
              }));
    });
  }
}

class TwoDimensionalGridView extends TwoDimensionalScrollView {
  const TwoDimensionalGridView({
    required TwoDimensionalChildBuilderDelegate delegate,
    required this.itemHeight,
    required this.itemWidth,
    super.key,
    super.primary,
    super.mainAxis = Axis.vertical,
    super.verticalDetails = const ScrollableDetails.vertical(),
    super.horizontalDetails = const ScrollableDetails.horizontal(),
    super.cacheExtent,
    super.diagonalDragBehavior = DiagonalDragBehavior.none,
    super.dragStartBehavior = DragStartBehavior.start,
    super.keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual,
    super.clipBehavior = Clip.hardEdge,
  }) : super(delegate: delegate);

  final double itemHeight;
  final double itemWidth;

  @override
  Widget buildViewport(
    BuildContext context,
    ViewportOffset verticalOffset,
    ViewportOffset horizontalOffset,
  ) {
    return TwoDimensionalGridViewport(
      horizontalOffset: horizontalOffset,
      horizontalAxisDirection: horizontalDetails.direction,
      verticalOffset: verticalOffset,
      verticalAxisDirection: verticalDetails.direction,
      mainAxis: mainAxis,
      delegate: delegate as TwoDimensionalChildBuilderDelegate,
      cacheExtent: cacheExtent,
      clipBehavior: clipBehavior,
      itemHeight: itemHeight,
      itemWidth: itemWidth,
    );
  }
}

class TwoDimensionalGridViewport extends TwoDimensionalViewport {
  const TwoDimensionalGridViewport({
    super.key,
    required super.verticalOffset,
    required super.verticalAxisDirection,
    required super.horizontalOffset,
    required super.horizontalAxisDirection,
    required TwoDimensionalChildBuilderDelegate super.delegate,
    required super.mainAxis,
    required this.itemHeight,
    required this.itemWidth,
    super.cacheExtent,
    super.clipBehavior = Clip.hardEdge,
  });

  final double itemHeight;
  final double itemWidth;

  @override
  RenderTwoDimensionalViewport createRenderObject(BuildContext context) {
    return RenderTwoDimensionalGridViewport(
      horizontalOffset: horizontalOffset,
      horizontalAxisDirection: horizontalAxisDirection,
      verticalOffset: verticalOffset,
      verticalAxisDirection: verticalAxisDirection,
      mainAxis: mainAxis,
      delegate: delegate as TwoDimensionalChildBuilderDelegate,
      childManager: context as TwoDimensionalChildManager,
      cacheExtent: cacheExtent,
      clipBehavior: clipBehavior,
      itemWidth: itemWidth,
      itemHeight: itemHeight,
    );
  }

  @override
  void updateRenderObject(
    BuildContext context,
    RenderTwoDimensionalGridViewport renderObject,
  ) {
    renderObject
      ..horizontalOffset = horizontalOffset
      ..horizontalAxisDirection = horizontalAxisDirection
      ..verticalOffset = verticalOffset
      ..verticalAxisDirection = verticalAxisDirection
      ..mainAxis = mainAxis
      ..delegate = delegate
      ..cacheExtent = cacheExtent
      ..clipBehavior = clipBehavior;
  }
}

class RenderTwoDimensionalGridViewport extends RenderTwoDimensionalViewport {
  RenderTwoDimensionalGridViewport({
    required super.horizontalOffset,
    required super.horizontalAxisDirection,
    required super.verticalOffset,
    required super.verticalAxisDirection,
    required TwoDimensionalChildBuilderDelegate delegate,
    required super.mainAxis,
    required super.childManager,
    required this.itemHeight,
    required this.itemWidth,
    super.cacheExtent,
    super.clipBehavior = Clip.hardEdge,
  }) : super(delegate: delegate);

  final double itemHeight;
  final double itemWidth;

  @override
  void layoutChildSequence() {
    final double horizontalPixels = horizontalOffset.pixels;
    final double verticalPixels = verticalOffset.pixels;
    final double viewportWidth = viewportDimension.width + cacheExtent;
    final double viewportHeight = viewportDimension.height + cacheExtent;
    final TwoDimensionalChildBuilderDelegate builderDelegate =
        delegate as TwoDimensionalChildBuilderDelegate;

    final int maxRowIndex = builderDelegate.maxYIndex!;
    final int maxColumnIndex = builderDelegate.maxXIndex!;

    final int leadingColumn =
        math.max((horizontalPixels / itemWidth).floor(), 0);
    final int leadingRow = math.max((verticalPixels / itemHeight).floor(), 0);
    final int trailingColumn = math.min(
      ((horizontalPixels + viewportWidth) / itemWidth).ceil(),
      maxColumnIndex,
    );
    final int trailingRow = math.min(
      ((verticalPixels + viewportHeight) / itemHeight).ceil(),
      maxRowIndex,
    );

    double xLayoutOffset =
        (leadingColumn * itemWidth) - horizontalOffset.pixels;
    for (int column = leadingColumn; column <= trailingColumn; column++) {
      double yLayoutOffset = (leadingRow * itemHeight) - verticalOffset.pixels;
      for (int row = leadingRow; row <= trailingRow; row++) {
        final ChildVicinity vicinity =
            ChildVicinity(xIndex: column, yIndex: row);
        final RenderBox child = buildOrObtainChildFor(vicinity)!;
        child.layout(constraints.loosen());

        // Subclasses only need to set the normalized layout offset. The super
        // class adjusts for reversed axes.
        parentDataOf(child).layoutOffset = Offset(xLayoutOffset, yLayoutOffset);
        yLayoutOffset += itemHeight;
      }
      xLayoutOffset += itemWidth;
    }

    // Set the min and max scroll extents for each axis.
    final double verticalExtent = itemHeight * (maxRowIndex + 1);
    verticalOffset.applyContentDimensions(
      0.0,
      clampDouble(
          verticalExtent - viewportDimension.height, 0.0, double.infinity),
    );
    final double horizontalExtent = itemWidth * (maxColumnIndex + 1);
    horizontalOffset.applyContentDimensions(
      0.0,
      clampDouble(
          horizontalExtent - viewportDimension.width, 0.0, double.infinity),
    );
    // Super class handles garbage collection too!
  }
}
