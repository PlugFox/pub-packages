import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:pub_packages/src/feature/settings/widget/settings_scope.dart';

/// {@template settings_screen.settings_screen}
/// SettingsScreen widget
/// {@endtemplate}
class SettingsScreen extends StatelessWidget {
  /// {@macro settings_screen.settings_screen}
  const SettingsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
          centerTitle: true,
        ),
        body: const SafeArea(
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(24),
              child: CustomProgressIndicator(
                size: 256,
                child: ThemeSwitcher(size: 128),
              ),
            ),
          ),
        ),
      );
} // SettingsScreen

/// {@template main.main}
/// ThemeSwitcher widget
/// {@endtemplate}
class ThemeSwitcher extends StatelessWidget {
  /// {@macro main.main}
  const ThemeSwitcher({
    this.size = 64,
    Key? key,
  }) : super(key: key);

  /// The size of the icon
  final double size;

  @override
  Widget build(BuildContext context) => Theme.of(context).brightness == Brightness.dark
      ? IconButton(
          icon: const Icon(Icons.nightlight),
          padding: EdgeInsets.zero,
          iconSize: size,
          tooltip: 'Switch to light theme',
          onPressed: () => SettingsScope.of(context).setLightTheme(),
        )
      : IconButton(
          icon: const Icon(Icons.sunny),
          padding: EdgeInsets.zero,
          iconSize: size,
          tooltip: 'Switch to dark theme',
          onPressed: () => SettingsScope.of(context).setDarkTheme(),
        );
} // ThemeSwitcher

/// {@template custom_progress_indicator}
/// CustomProgressIndicator widget
/// {@endtemplate}
class CustomProgressIndicator extends StatefulWidget {
  /// {@macro custom_progress_indicator}
  const CustomProgressIndicator({
    this.size = 64,
    this.child,
    Key? key,
  }) : super(key: key);

  /// The size of the progress indicator
  final double size;

  /// The child widget
  final Widget? child;

  @override
  State<CustomProgressIndicator> createState() => _CustomProgressIndicatorState();
} // CustomProgressIndicator

/// State for widget CustomProgressIndicator
class _CustomProgressIndicatorState extends State<CustomProgressIndicator> with SingleTickerProviderStateMixin {
  late final AnimationController _sweepController;
  late final Animation<double> _curvedAnimation;

  /* #region Lifecycle */
  @override
  void initState() {
    super.initState();
    _sweepController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat();
    _curvedAnimation = CurvedAnimation(
      parent: _sweepController,
      curve: Curves.ease,
    );
  }

  @override
  void dispose() {
    _sweepController.dispose();
    super.dispose();
  }
  /* #endregion */

  @override
  Widget build(BuildContext context) => SizedBox.square(
        dimension: widget.size,
        child: RepaintBoundary(
          child: CustomPaint(
            painter: _ProgressIndicatorPainter(
              animation: _curvedAnimation,
              color: Theme.of(context).indicatorColor,
            ),
            child: Center(
              child: widget.child,
            ),
          ),
        ),
      );
} // _CustomProgressIndicatorState

/// {@template progress_indicator_painter}
/// _ProgressIndicatorPainter
/// {@endtemplate}
class _ProgressIndicatorPainter extends CustomPainter {
  /// {@macro progress_indicator_painter}
  _ProgressIndicatorPainter({
    required Animation<double> animation,
    Color color = Colors.blue,
  })  : _animation = animation,
        _arcPaint = Paint()
          ..strokeCap = StrokeCap.round
          ..style = PaintingStyle.stroke
          ..color = color,
        super(repaint: animation);

  final Animation<double> _animation;
  final Paint _arcPaint;

  @override
  void paint(Canvas canvas, Size size) {
    _arcPaint.strokeWidth = size.shortestSide / 8;
    final progress = _animation.value;
    final rect = Rect.fromCircle(
      center: size.center(Offset.zero),
      radius: size.shortestSide / 2 - _arcPaint.strokeWidth / 2,
    );
    //final rotate = progress * lerpDouble(.0, math.pi * 2, progress)!;
    final rotate = math.pow(progress, 2) * math.pi * 2;
    final sweep = math.sin(progress * math.pi) * 3 + math.pi * .25;

    canvas.drawArc(rect, rotate, sweep, false, _arcPaint);
  }

  @override
  bool shouldRepaint(
    covariant _ProgressIndicatorPainter oldDelegate,
  ) =>
      _animation.value != oldDelegate._animation.value;

  @override
  bool shouldRebuildSemantics(
    covariant _ProgressIndicatorPainter oldDelegate,
  ) =>
      false;
} // _ProgressIndicatorPainter