import 'package:flutter/material.dart';
import 'package:tulkit/pages/pomodoro/time_elapsed_painter.dart';

const int _kIndeterminateCircularDuration = 1333 * 2222;

class TimeElapsedIndicator extends ProgressIndicator {
  /// Creates a circular progress indicator.
  ///
  /// {@macro flutter.material.progressIndicator.parameters}
  const TimeElapsedIndicator({
    Key key,
    double value,
    Color unElapsedLineColor,
    this.elapsedLineColor,
    this.strokeWidth = 2.0,
    String semanticsLabel,
    String semanticsValue,
  }) : super(
          key: key,
          value: value,
          backgroundColor: unElapsedLineColor,
          semanticsLabel: semanticsLabel,
          semanticsValue: semanticsValue,
        );

  /// The width of the line used to draw the circle.
  final double strokeWidth;
  final Color elapsedLineColor;

  Widget _buildSemanticsWrapper({
    @required BuildContext context,
    @required Widget child,
  }) {
    String expandedSemanticsValue = semanticsValue;
    if (value != null) {
      expandedSemanticsValue ??= '${(value * 100).round()}%';
    }
    return Semantics(
      label: semanticsLabel,
      value: expandedSemanticsValue,
      child: child,
    );
  }

  @override
  _TimeElapsedIndicator createState() => _TimeElapsedIndicator();
}

class _TimeElapsedIndicator extends State<TimeElapsedIndicator>
    with SingleTickerProviderStateMixin {
  static const int _pathCount = _kIndeterminateCircularDuration ~/ 1333;
  static const int _rotationCount = 1;

  static final Animatable<double> _strokeHeadTween = CurveTween(
    curve: const Interval(0.0, 0.5, curve: Curves.fastOutSlowIn),
  ).chain(CurveTween(
    curve: const SawTooth(_pathCount),
  ));

  static final Animatable<double> _strokeTailTween = CurveTween(
    curve: const Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
  ).chain(CurveTween(
    curve: const SawTooth(_pathCount),
  ));

  static final Animatable<double> _offsetTween =
      CurveTween(curve: const SawTooth(_pathCount));
  static final Animatable<double> _rotationTween =
      CurveTween(curve: const SawTooth(_rotationCount));

  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: _kIndeterminateCircularDuration),
      vsync: this,
    );
  }

  @override
  void didUpdateWidget(TimeElapsedIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    _controller.stop();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildIndicator(BuildContext context, double headValue,
      double tailValue, double offsetValue, double rotationValue) {
    return widget._buildSemanticsWrapper(
      context: context,
      child: Container(
        child: CustomPaint(
          painter: TimeElapsedPainter(
            backgroundColor: widget.backgroundColor,
            valueColor: widget.elapsedLineColor,
            value: widget.value,
            headValue: headValue,
            tailValue: tailValue,
            offsetValue: offsetValue,
            rotationValue: rotationValue,
            strokeWidth: widget.strokeWidth,
          ),
        ),
      ),
    );
  }

  Widget _buildAnimation() {
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget child) {
        return _buildIndicator(
          context,
          _strokeHeadTween.evaluate(_controller),
          _strokeTailTween.evaluate(_controller),
          _offsetTween.evaluate(_controller),
          _rotationTween.evaluate(_controller),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.value != null) return _buildIndicator(context, 0.0, 0.0, 0, 0.0);
    return _buildAnimation();
  }
}
