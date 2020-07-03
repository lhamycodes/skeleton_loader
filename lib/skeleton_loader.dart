library skeleton_loader;

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

part 'src/skeleton_list.dart';
part 'src/skeleton_grid.dart';

enum SkeletonDirection { ltr, rtl, ttb, btt }

ShimmerDirection getDirection(SkeletonDirection skDirection) {
  ShimmerDirection direction;
  switch (skDirection) {
    case SkeletonDirection.ltr:
      direction = ShimmerDirection.ltr;
      break;
    case SkeletonDirection.rtl:
      direction = ShimmerDirection.rtl;
      break;
    case SkeletonDirection.btt:
      direction = ShimmerDirection.btt;
      break;
    case SkeletonDirection.ttb:
      direction = ShimmerDirection.ttb;
      break;
    default:
      direction = ShimmerDirection.ltr;
  }

  return direction;
}
