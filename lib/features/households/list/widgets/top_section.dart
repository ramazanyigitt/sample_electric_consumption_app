part of '../home_view.dart';

class _TopSection extends ViewModelWidget<HomeViewModel> {
  const _TopSection({
    Key? key,
  }) : super(key: key, reactive: true);

  @override
  Widget build(BuildContext context, viewModel) {
    return SliverPersistentHeader(
      delegate: _PersistentHeaderDelegate(
        viewModel,
        70,
      ),
    );
  }
}

class _PersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  final HomeViewModel viewModel;
  final double height;
  _PersistentHeaderDelegate(
    this.viewModel,
    this.height,
  );

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(
          child: Container(
            color: Colors.transparent,
            child: Text(
              'Households',
              style: AppTheme().paragraphMediumText,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Container(
          color: Colors.transparent,
          child: const Icon(
            Icons.sort_outlined,
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => height;

  @override
  double get minExtent => height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
