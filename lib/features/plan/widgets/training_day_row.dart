import 'package:flutter/material.dart';
import 'package:testapp/core/theme/app_colors.dart';
import 'package:testapp/features/plan/plan_view_model.dart';


import 'training_workout_card.dart';

class TrainingDayRow extends StatelessWidget {
  const TrainingDayRow({super.key, required this.entry});

  final PlanDayEntry entry;

  static const double kRowHeight = 75;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: kRowHeight,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 56,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      entry.weekdayShort,
                      style: const TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      '${entry.day}',
                      style: const TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),

              if (entry.workout != null)
                Expanded(child: TrainingWorkoutCard(workout: entry.workout!)),
            ],
          ),
        ),
        Divider(height: 1, thickness: 1, color: AppColors.planRowSeparator),
      ],
    );
  }
}
