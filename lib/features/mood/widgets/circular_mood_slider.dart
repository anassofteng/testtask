import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:testapp/core/theme/app_colors.dart';


class CircularMoodSlider extends StatelessWidget {
  const CircularMoodSlider({
    super.key,
    required this.angleRadians,
    required this.onAngleChanged,
    required this.centerImagePath,
    this.size = 210,
    this.trackWidth = 32,
    this.thumbRadius = 22,
  });

  final double angleRadians;
  final ValueChanged<double> onAngleChanged;
  final String centerImagePath;
  final double size;
  final double trackWidth;
  final double thumbRadius;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return GestureDetector(
          onPanUpdate: (details) => _angleFromPosition(details.localPosition),
          onPanStart: (details) => _angleFromPosition(details.localPosition),
          child: CustomPaint(
            size: Size(size, size),
            painter: _MoodTrackPainter(
              angleRadians: angleRadians,
              trackWidth: trackWidth,
              thumbRadius: thumbRadius,
            ),
            child: Center(
              child: IgnorePointer(
                child: Container(
                  width: size - trackWidth * 2 - thumbRadius * 4,
                  height: size - trackWidth * 2 - thumbRadius * 4,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.backgroundDark,
                    shape: BoxShape.circle,
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      centerImagePath,
                      fit: BoxFit.cover,
                      width: size - trackWidth * 2 - thumbRadius * 4,
                      height: size - trackWidth * 2 - thumbRadius * 4,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _angleFromPosition(Offset localPosition) {
    final center = Offset(size / 2, size / 2);
    final delta = localPosition - center;
    double angle = math.atan2(delta.dx, -delta.dy);
    if (angle < 0) angle += 2 * math.pi;
    onAngleChanged(angle);
  }
}

class _MoodTrackPainter extends CustomPainter {
  _MoodTrackPainter({
    required this.angleRadians,
    required this.trackWidth,
    required this.thumbRadius,
  });

  final double angleRadians;
  final double trackWidth;
  final double thumbRadius;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final outerRadius = size.width / 2 - thumbRadius;
    final innerRadius = outerRadius - trackWidth;

    final rect = Rect.fromCircle(center: center, radius: outerRadius + 2);
    final gradient = SweepGradient(
      center: Alignment.center,
      startAngle: 0,
      endAngle: 2 * math.pi,
      colors: const [
        AppColors.moodGradientTeal,
        AppColors.moodGradientOrange,
        AppColors.moodGradientPink,
        AppColors.moodGradientPurple,
        AppColors.moodGradientTeal,
      ],
      stops: const [0.0, 0.25, 0.5, 0.75, 1.0],
    );
    final paint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = trackWidth;

    canvas.drawCircle(center, outerRadius - trackWidth / 2, paint);

    final holePaint = Paint()
      ..color = AppColors.backgroundDark
      ..style = PaintingStyle.fill;
    canvas.drawCircle(center, innerRadius, holePaint);

    final thumbX =
        center.dx + (outerRadius - trackWidth / 2) * math.sin(angleRadians);
    final thumbY =
        center.dy - (outerRadius - trackWidth / 2) * math.cos(angleRadians);
    final thumbPaint = Paint()
      ..color = AppColors.moodThumb
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(thumbX, thumbY), thumbRadius, thumbPaint);

    final thumbBorder = Paint()
      ..color = AppColors.textSecondary.withValues(alpha: 0.3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
    canvas.drawCircle(Offset(thumbX, thumbY), thumbRadius, thumbBorder);
  }

  @override
  bool shouldRepaint(covariant _MoodTrackPainter oldDelegate) {
    return oldDelegate.angleRadians != angleRadians;
  }
}
