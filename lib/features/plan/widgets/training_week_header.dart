import 'package:flutter/material.dart';
import 'package:testapp/core/theme/app_colors.dart';



class TrainingWeekHeader extends StatelessWidget {
  const TrainingWeekHeader({
    super.key,
    required this.weekLabel,
    required this.dateRange,
    required this.totalMinutes,
  });

  final String weekLabel;
  final String dateRange;
  final int totalMinutes;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                weekLabel,
                style: const TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                dateRange,
                style: const TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          const Spacer(),
          Text(
            'Total: ${totalMinutes}min',
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
