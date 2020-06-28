part of skeleton_loader;

class SkeletonLoader extends StatefulWidget {
  /// Number of skeleton items to show
  /// Default is 1
  final int items;

  /// A layout of how you want your skeleton to look like
  final Widget loaderShell;

  /// Base Color of the skeleton list item
  /// Defaults to Colors.grey[300]
  final Color baseColor;

  /// Highlight Color of the skeleton list item
  /// Defaults to Colors.grey[100]
  final Color hightlightColor;

  /// Highlight Color of the skeleton list item
  /// Defaults to ShimmerDirection.rtl
  final ShimmerDirection direction;

  const SkeletonLoader({
    Key key,
    this.items = 1,
    @required this.loaderShell,
    this.baseColor = const Color(0xFFE0E0E0),
    this.hightlightColor = const Color(0xFFF5F5F5),
    this.direction = ShimmerDirection.rtl,
  }) : super(key: key);

  @override
  _SkeletonLoaderState createState() => _SkeletonLoaderState();
}

class _SkeletonLoaderState extends State<SkeletonLoader> {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: widget.baseColor,
      highlightColor: widget.hightlightColor,
      direction: widget.direction,
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (_, __) => widget.loaderShell,
        itemCount: widget.items,
      ),
    );
  }
}
