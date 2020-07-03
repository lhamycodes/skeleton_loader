part of skeleton_loader;

class SkeletonGridLoader extends StatefulWidget {
  /// Number of skeleton items to show
  final int items;

  /// A layout of how you want your skeleton to look like
  final Widget builder;

  /// Number of skeleton items to show
  /// Default is 2
  final int itemsPerRow;

  /// Base Color of the skeleton list item
  /// Defaults to Colors.grey[300]
  final Color baseColor;

  /// Highlight Color of the skeleton list item
  /// Defaults to Colors.grey[100]
  final Color hightlightColor;

  /// Highlight Color of the skeleton list item
  /// Defaults to ShimmerDirection.rtl
  final SkeletonDirection direction;

  /// Duration in which the transition takes place
  /// Defaults to Duration(seconds: 2)
  final Duration period;

  const SkeletonGridLoader({
    Key key,
    @required this.items,
    @required this.builder,
    this.itemsPerRow = 2,
    this.baseColor = const Color(0xFFE0E0E0),
    this.hightlightColor = const Color(0xFFF5F5F5),
    this.direction = SkeletonDirection.ltr,
    this.period = const Duration(seconds: 2),
  }) : super(key: key);

  @override
  _SkeletonGridLoaderState createState() => _SkeletonGridLoaderState();
}

class _SkeletonGridLoaderState extends State<SkeletonGridLoader> {
  @override
  Widget build(BuildContext context) {
    ShimmerDirection direction = getDirection(widget.direction);

    return Column(
      children: [
        Shimmer.fromColors(
          baseColor: widget.baseColor,
          highlightColor: widget.hightlightColor,
          direction: direction,
          period: widget.period,
          child: GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (_, __) => Container(
              child: widget.builder,
            ),
            itemCount: widget.items,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: widget.itemsPerRow,
            ),
          ),
        ),
      ],
    );
  }
}
