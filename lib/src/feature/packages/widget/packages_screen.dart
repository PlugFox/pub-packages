import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:pub_packages/src/common/router/routes.dart';
import 'package:pub_packages/src/feature/favorites/widget/favorites_scope.dart';
import 'package:pub_packages/src/feature/package/model/package.dart';
import 'package:pub_packages/src/feature/packages/widget/packages_list_view.dart';
import 'package:pub_packages/src/feature/packages/widget/packages_scope.dart';

/// {@template packages_screen}
/// PackagesScreen widget
/// {@endtemplate}
class PackagesScreen extends StatefulWidget {
  /// {@macro packages_screen}
  const PackagesScreen({
    this.tab,
    Key? key,
  }) : super(key: key);

  static const List<String> tabs = <String>['All', 'Favorite'];

  final String? tab;

  /// The state from the closest instance of this class
  /// that encloses the given context, if any.
  @internal
  static _PackagesScreenState? maybeOf(BuildContext context) => context.findAncestorStateOfType<_PackagesScreenState>();

  @override
  State<PackagesScreen> createState() => _PackagesScreenState();
} // PackagesScreen

/// State for widget PackagesScreen
class _PackagesScreenState extends State<PackagesScreen> with TickerProviderStateMixin {
  late final TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(
      length: PackagesScreen.tabs.length,
      vsync: this,
      initialIndex: _currentTab,
    );
  }

  @override
  void didUpdateWidget(PackagesScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.tab != oldWidget.tab && widget.tab != null) {
      _controller.animateTo(_currentTab);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  int get _currentTab {
    for (var i = 0; i < PackagesScreen.tabs.length; i++) {
      if (PackagesScreen.tabs[i] == widget.tab) {
        return i;
      }
    }
    return 0;
  }

  void _onTabChanged(int index) => PackagesRoute(tab: PackagesScreen.tabs[index]).go(context);

  void _onPackageSelected(Package package) => PackageRoute(name: package.name).go(context);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Packages'),
          centerTitle: true,
          bottom: TabBar(
            controller: _controller,
            tabs: PackagesScreen.tabs.map<Widget>((e) => Tab(text: e)).toList(growable: false),
            onTap: _onTabChanged,
          ),
        ),
        body: SafeArea(
          child: Center(
            child: TabBarView(
              controller: _controller,
              children: <Widget>[
                PackagesListView(
                  packages: PackagesScope.packagesOf(context, listen: true),
                  onTap: _onPackageSelected,
                ),
                PackagesListView(
                  packages: FavoritesScope.favoritesOf(context, listen: true),
                  onTap: _onPackageSelected,
                ),
              ],
            ),
          ),
        ),
      );
} // _PackagesScreenState
