import 'package:flutter/material.dart';
import 'package:testapp/core/theme/app_colors.dart';



class PlanHeader extends StatelessWidget {
  const PlanHeader({super.key, required this.weekLabel});

  final String weekLabel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Icon(
            Icons.notifications_none,
            color: AppColors.textPrimary,
            size: 26,
          ),
          const Spacer(),
          Icon(Icons.schedule, color: AppColors.textPrimary, size: 20),
          const SizedBox(width: 6),
          Text(
            weekLabel,
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 4),
          Icon(
            Icons.keyboard_arrow_down,
            color: AppColors.textPrimary,
            size: 24,
          ),
          const Spacer(),
          const SizedBox(width: 26),
        ],
      ),
    );
  }
}
