import 'package:flutter/material.dart';
import 'package:testapp/core/theme/app_colors.dart';



class HydrationCard extends StatelessWidget {
  const HydrationCard({
    super.key,
    this.percent = 0,
    this.currentMl = 0,
    this.onLogNow,
    this.bannerText = '500 ml added to water log',
  });

  final int percent;
  final int currentMl;
  final VoidCallback? onLogNow;
  final String bannerText;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.hydrationCardBg,
        borderRadius: BorderRadius.circular(12),
        border: Border(top: BorderSide(color: AppColors.navTopLine, width: 1)),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$percent%',
                      style: const TextStyle(
                        color: AppColors.hydrationBlue,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      'Hydration',
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    GestureDetector(
                      onTap: onLogNow,
                      child: const Text(
                        'Log Now',
                        style: TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                _WaterMeter(currentMl: currentMl),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: const BoxDecoration(
              color: AppColors.hydrationCardBanner,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
            ),
            child: Center(
              child: Text(
                bannerText,
                style: const TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _WaterMeter extends StatelessWidget {
  const _WaterMeter({this.currentMl = 0});

  final int currentMl;

  static const double _scaleHeight = 80;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          '2 L',
          style: TextStyle(color: AppColors.hydrationScaleLine, fontSize: 12),
        ),
        const SizedBox(height: 4),
        SizedBox(
          width: 32,
          height: _scaleHeight,
          child: CustomPaint(
            painter: _WaterMeterPainter(),
            size: const Size(32, _scaleHeight),
          ),
        ),
        const SizedBox(height: 4),
        const Text(
          '0 L',
          style: TextStyle(color: AppColors.hydrationScaleLine, fontSize: 12),
        ),
        Text(
          '${currentMl}ml',
          style: const TextStyle(
            color: AppColors.hydrationScaleLine,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}

class _WaterMeterPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const double dashHeight = 3;
    const double gapHeight = 4;
    const double lineX = 4;
    const double indicatorWidth = 8;
    const double indicatorHeight = 4;

    final dashedPaint = Paint()
      ..color = AppColors.hydrationScaleLine
      ..strokeWidth = 1;

    final indicatorPaint = Paint()
      ..color = AppColors.hydrationBlue
      ..style = PaintingStyle.fill;

    double y = 0;
    while (y < size.height) {
      canvas.drawLine(
        Offset(lineX, y),
        Offset(lineX, y + dashHeight),
        dashedPaint,
      );
      y += dashHeight + gapHeight;
    }

    const int indicatorCount = 5;
    for (var i = 0; i < indicatorCount; i++) {
      final ty = size.height * (i / (indicatorCount - 1));
      final rect = RRect.fromRectAndRadius(
        Rect.fromCenter(
          center: Offset(lineX + indicatorWidth / 2 + 2, ty),
          width: indicatorWidth,
          height: indicatorHeight,
        ),
        const Radius.circular(1),
      );
      canvas.drawRRect(rect, indicatorPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
