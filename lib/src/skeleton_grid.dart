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
  final Color highlightColor;

  /// Highlight Color of the skeleton list item
  /// Defaults to ShimmerDirection.rtl
  final SkeletonDirection direction;

  /// Duration in which the transition takes place
  /// Defaults to Duration(seconds: 2)
  final Duration period;

  /// Spacing between items on the cross axis
  /// Defaults to 10
  final double crossAxisSpacing;

  /// Spacing between items on the main axis
  /// Defaults to 10
  final double mainAxisSpacing;

  /// Aspect ratio of each grid item
  /// Defaults to 1.0
  final double childAspectRatio;

  const SkeletonGridLoader({
    Key? key,
    required this.items,
    required this.builder,
    this.itemsPerRow = 2,
    this.baseColor = const Color(0xFFE0E0E0),
    this.highlightColor = const Color(0xFFF5F5F5),
    this.direction = SkeletonDirection.ltr,
    this.period = const Duration(seconds: 2),
    this.crossAxisSpacing = 10,
    this.mainAxisSpacing = 10,
    this.childAspectRatio = 1.0,
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
          highlightColor: widget.highlightColor,
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
              crossAxisSpacing: widget.crossAxisSpacing,
              mainAxisSpacing: widget.mainAxisSpacing,
              childAspectRatio: widget.childAspectRatio,
            ),
          ),
        ),
      ],
    );
  }
}
