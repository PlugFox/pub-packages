import 'package:flutter/material.dart';
import 'package:pub_packages/src/feature/favorites/widget/favorite_button.dart';
import 'package:pub_packages/src/feature/package/model/package.dart';

/// {@template packages_list_view.packages_list_view}
/// PackagesListView widget
/// {@endtemplate}
class PackagesListView extends StatefulWidget {
  /// {@macro packages_list_view.packages_list_view}
  const PackagesListView({
    required this.packages,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  final List<Package> packages;
  final void Function(Package package) onTap;

  @override
  State<PackagesListView> createState() => _PackagesListViewState();
} // PackagesListView

class _PackagesListViewState extends State<PackagesListView> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    // Call `super.build` when using `AutomaticKeepAliveClientMixin`.
    super.build(context);
    return ListView.separated(
      itemCount: widget.packages.length,
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: (context, index) {
        final package = widget.packages[index];
        return ListTile(
          key: ValueKey<String>(package.name),
          title: Text(package.name),
          onTap: () => widget.onTap(package),
          trailing: FavoriteButton(packageName: package.name),
        );
      },
    );
  }
}
