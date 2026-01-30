

import 'package:testapp/core/base/base_view_model.dart';

class PlanViewModel extends BaseViewModel {
  PlanViewModel() {
    _weeks = _buildSampleWeeks();
  }

  late List<PlanWeekSection> _weeks;

  List<PlanWeekSection> get weeks => _weeks;

  static List<PlanWeekSection> _buildSampleWeeks() {
    return [
      PlanWeekSection(
        weekLabel: 'Week 2/8',
        dateRange: 'December 8-14',
        totalMinutes: 60,
        days: [
          PlanDayEntry(
            weekdayShort: 'Mon',
            day: 8,
            workout: PlanWorkout(
              tagLabel: 'Arms Workout',
              tagColorGreen: true,
              title: 'Arm Blaster',
              duration: '25m - 30m',
            ),
          ),
          PlanDayEntry(weekdayShort: 'Tue', day: 9, workout: null),
          PlanDayEntry(weekdayShort: 'Wed', day: 10, workout: null),
          PlanDayEntry(
            weekdayShort: 'Thu',
            day: 11,
            workout: PlanWorkout(
              tagLabel: 'Leg Workout',
              tagColorGreen: false,
              title: 'Leg Day Blitz',
              duration: '25m - 30m',
            ),
          ),
          PlanDayEntry(weekdayShort: 'Fri', day: 12, workout: null),
          PlanDayEntry(weekdayShort: 'Sat', day: 13, workout: null),
          PlanDayEntry(weekdayShort: 'Sun', day: 14, workout: null),
        ],
      ),
      PlanWeekSection(
        weekLabel: 'Week 2',
        dateRange: 'December 14-22',
        totalMinutes: 60,
        days: [
          PlanDayEntry(weekdayShort: 'Mon', day: 15, workout: null),
          PlanDayEntry(weekdayShort: 'Tue', day: 16, workout: null),
          PlanDayEntry(weekdayShort: 'Wed', day: 17, workout: null),
          PlanDayEntry(weekdayShort: 'Thu', day: 18, workout: null),
          PlanDayEntry(weekdayShort: 'Fri', day: 19, workout: null),
          PlanDayEntry(weekdayShort: 'Sat', day: 20, workout: null),
          PlanDayEntry(weekdayShort: 'Sun', day: 21, workout: null),
        ],
      ),
    ];
  }
}

class PlanWeekSection {
  PlanWeekSection({
    required this.weekLabel,
    required this.dateRange,
    required this.totalMinutes,
    required this.days,
  });

  final String weekLabel;
  final String dateRange;
  final int totalMinutes;
  final List<PlanDayEntry> days;
}

class PlanDayEntry {
  PlanDayEntry({required this.weekdayShort, required this.day, this.workout});

  final String weekdayShort;
  final int day;
  final PlanWorkout? workout;
}

class PlanWorkout {
  PlanWorkout({
    required this.tagLabel,
    required this.tagColorGreen,
    required this.title,
    required this.duration,
  });

  final String tagLabel;
  final bool tagColorGreen;
  final String title;
  final String duration;
}
