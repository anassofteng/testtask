import 'package:flutter/material.dart';
import 'package:testapp/core/theme/app_colors.dart';



class PlanDateStrip extends StatelessWidget {
  const PlanDateStrip({
    super.key,
    required this.weekDates,
    required this.selectedIndex,
    required this.onDateSelected,
    this.dayLabels = const ['M', 'TU', 'W', 'TH', 'F', 'SA', 'SU'],
  });

  final List<DateTime> weekDates;
  final int selectedIndex;
  final ValueChanged<int> onDateSelected;
  final List<String> dayLabels;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: List.generate(
              weekDates.length,
              (index) => Expanded(
                child: _DayColumn(
                  dayLabel: dayLabels[index],
                  date: weekDates[index],
                  isSelected: index == selectedIndex,
                  onTap: () => onDateSelected(index),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),
        Divider(height: 1, color: AppColors.navTopLine, thickness: 1),
      ],
    );
  }
}

class _DayColumn extends StatelessWidget {
  const _DayColumn({
    required this.dayLabel,
    required this.date,
    required this.isSelected,
    required this.onTap,
  });

  final String dayLabel;
  final DateTime date;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            dayLabel,
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isSelected
                  ? AppColors.accentGreen
                  : AppColors.cardBackground,
              border: isSelected ? null : null,
            ),
            alignment: Alignment.center,
            child: Text(
              '${date.day}',
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 4),
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isSelected ? AppColors.accentGreen : Colors.transparent,
            ),
          ),
        ],
      ),
    );
  }
}
