import 'package:flutter/material.dart';
import 'package:testapp/core/theme/app_colors.dart';


import 'plan_view_model.dart';
import 'widgets/training_day_row.dart';
import 'widgets/training_week_header.dart';

class PlanScreen extends StatefulWidget {
  const PlanScreen({super.key});

  @override
  State<PlanScreen> createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  late final PlanViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = PlanViewModel();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildTopBar(),
            Expanded(
              child: ListenableBuilder(
                listenable: _viewModel,
                builder: (context, _) {
                  final weeks = _viewModel.weeks;
                  return ListView.builder(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
                    itemCount: weeks.length,
                    itemBuilder: (context, weekIndex) {
                      final week = weeks[weekIndex];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (weekIndex > 0) ...[
                            const SizedBox(height: 8),
                            Divider(
                              height: 1,
                              thickness: 2,
                              color: AppColors.planWeekSeparator,
                            ),
                            const SizedBox(height: 16),
                          ],
                          TrainingWeekHeader(
                            weekLabel: week.weekLabel,
                            dateRange: week.dateRange,
                            totalMinutes: week.totalMinutes,
                          ),
                          ...week.days.map((e) => TrainingDayRow(entry: e)),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          const Text(
            'Training Calendar',
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          TextButton(
            onPressed: () {},
            child: const Text(
              'Save',
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
