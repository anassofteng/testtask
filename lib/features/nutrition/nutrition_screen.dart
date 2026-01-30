import 'package:flutter/material.dart';
import 'package:testapp/core/theme/app_colors.dart';
import 'package:testapp/features/nutrition/nutrition_view_model.dart';



import '../plan/widgets/calendar_bottom_sheet.dart';
import '../plan/widgets/hydration_card.dart';
import '../plan/widgets/insight_cards_row.dart';
import '../plan/widgets/plan_date_strip.dart';
import '../plan/widgets/plan_header.dart';
import '../plan/widgets/workout_card.dart';


class NutritionScreen extends StatefulWidget {
  const NutritionScreen({super.key});

  @override
  State<NutritionScreen> createState() => _NutritionScreenState();
}

class _NutritionScreenState extends State<NutritionScreen> {
  late final NutritionViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = NutritionViewModel();
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
            PlanHeader(weekLabel: _viewModel.weekLabel),
            ListenableBuilder(
              listenable: _viewModel,
              builder: (context, _) => Padding(
                padding: const EdgeInsets.only(left: 16, bottom: 16),
                child: Text(
                  _viewModel.selectedDateLabel,
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            ListenableBuilder(
              listenable: _viewModel,
              builder: (context, _) => PlanDateStrip(
                weekDates: _viewModel.weekDates,
                selectedIndex: _viewModel.selectedDateIndex,
                onDateSelected: (index) {
                  final date = _viewModel.weekDates[index];
                  showCalendarBottomSheet(
                    context,
                    initialDate: date,
                    onDateSelected: (selectedDate) {
                      _viewModel.navigateToDate(selectedDate);
                      if (context.mounted) Navigator.pop(context);
                    },
                  );
                },
                dayLabels: _viewModel.dayLabels,
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Workouts',
                          style: TextStyle(
                            color: AppColors.textPrimary,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.wb_sunny_outlined,
                              color: AppColors.textPrimary,
                              size: 20,
                            ),
                            const SizedBox(width: 4),
                            const Text(
                              '9°',
                              style: TextStyle(
                                color: AppColors.textPrimary,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    const WorkoutCard(),
                    const SizedBox(height: 24),
                    const Text(
                      'My Insights',
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const InsightCardsRow(),
                    const SizedBox(height: 12),
                    const HydrationCard(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
