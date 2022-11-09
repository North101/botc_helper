import 'dart:math';

import 'package:flutter/material.dart';

class SliverChildSeperatedBuilderDelegate extends SliverChildBuilderDelegate {
  SliverChildSeperatedBuilderDelegate(
    Widget? Function(BuildContext context, int index) builder,
    Widget? Function(BuildContext context, int index) separatedBy, {
    super.findChildIndexCallback,
    int? childCount,
    super.addAutomaticKeepAlives,
    super.addRepaintBoundaries,
    super.addSemanticIndexes,
    super.semanticIndexCallback,
    super.semanticIndexOffset,
  }) : super(
          (context, index) => index.isEven ? builder(context, index ~/ 2) : separatedBy(context, index ~/ 2),
          childCount: childCount != null ? max((childCount * 2) - 1, 0) : null,
        );
}
