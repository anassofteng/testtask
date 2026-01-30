import 'package:flutter/material.dart';
import 'package:testapp/core/theme/app_colors.dart';


void showCalendarBottomSheet(
  BuildContext context, {
  required DateTime initialDate,
  required ValueChanged<DateTime> onDateSelected,
}) {
  showModalBottomSheet<void>(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (context) => _CalendarBottomSheet(
      initialDate: initialDate,
      onDateSelected: onDateSelected,
    ),
  );
}

class _CalendarBottomSheet extends StatefulWidget {
  const _CalendarBottomSheet({
    required this.initialDate,
    required this.onDateSelected,
  });

  final DateTime initialDate;
  final ValueChanged<DateTime> onDateSelected;

  @override
  State<_CalendarBottomSheet> createState() => _CalendarBottomSheetState();
}

class _CalendarBottomSheetState extends State<_CalendarBottomSheet> {
  static const List<String> _weekdayLabels = [
    'MON',
    'TUE',
    'WED',
    'THU',
    'FRI',
    'SAT',
    'SUN',
  ];

  static const List<String> _months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];

  late DateTime _displayedMonth;
  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    _displayedMonth = DateTime(
      widget.initialDate.year,
      widget.initialDate.month,
    );
    _selectedDate = widget.initialDate;
  }

  int get _daysInMonth {
    final next = DateTime(_displayedMonth.year, _displayedMonth.month + 1);
    return next.subtract(const Duration(days: 1)).day;
  }

  /// Weekday of the 1st (1 = Mon, 7 = Sun).
  int get _firstWeekday {
    final first = DateTime(_displayedMonth.year, _displayedMonth.month);
    return first.weekday;
  }

  String get _headerLabel =>
      '${_months[_displayedMonth.month - 1]} ${_displayedMonth.year}';

  void _previousMonth() {
    setState(() {
      _displayedMonth = DateTime(
        _displayedMonth.year,
        _displayedMonth.month - 1,
      );
    });
  }

  void _nextMonth() {
    setState(() {
      _displayedMonth = DateTime(
        _displayedMonth.year,
        _displayedMonth.month + 1,
      );
    });
  }

  void _onDateTap(DateTime date) {
    setState(() => _selectedDate = date);
    widget.onDateSelected(date);
  }

  @override
  Widget build(BuildContext context) {
    final paddingCount = _firstWeekday - 1;
    final totalCells = paddingCount + _daysInMonth;
    final rowCount = (totalCells / 7).ceil();

    return Container(
      decoration: const BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 12),
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.textSecondary,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: _previousMonth,
                  icon: Icon(Icons.chevron_left, color: AppColors.textPrimary),
                ),
                Text(
                  _headerLabel,
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                IconButton(
                  onPressed: _nextMonth,
                  icon: Icon(Icons.chevron_right, color: AppColors.textPrimary),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: _weekdayLabels
                  .map(
                    (label) => SizedBox(
                      width: 40,
                      child: Text(
                        label,
                        style: const TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 7,
                  childAspectRatio: 1,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                ),
                itemCount: rowCount * 7,
                itemBuilder: (context, index) {
                  if (index < paddingCount) {
                    return const SizedBox.shrink();
                  }
                  final dayIndex = index - paddingCount;
                  if (dayIndex >= _daysInMonth) {
                    return const SizedBox.shrink();
                  }
                  final day = dayIndex + 1;
                  final date = DateTime(
                    _displayedMonth.year,
                    _displayedMonth.month,
                    day,
                  );
                  final isSelected =
                      _selectedDate != null &&
                      _selectedDate!.year == date.year &&
                      _selectedDate!.month == date.month &&
                      _selectedDate!.day == date.day;

                  return GestureDetector(
                    onTap: () => _onDateTap(date),
                    behavior: HitTestBehavior.opaque,
                    child: Center(
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.transparent,
                          border: isSelected
                              ? Border.all(
                                  color: AppColors.accentGreen,
                                  width: 2,
                                )
                              : null,
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          '$day',
                          style: const TextStyle(
                            color: AppColors.textPrimary,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: MediaQuery.paddingOf(context).bottom + 16),
          ],
        ),
      ),
    );
  }
}
