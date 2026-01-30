

import 'package:testapp/core/base/base_view_model.dart';

class NutritionViewModel extends BaseViewModel {
  NutritionViewModel() {
    _weekDates = _buildCurrentWeekDates();
    _selectedDateIndex = _indexOfToday();
  }

  static const List<String> _dayLabels = [
    'M',
    'TU',
    'W',
    'TH',
    'F',
    'SA',
    'SU',
  ];

  late List<DateTime> _weekDates;
  late int _selectedDateIndex;

  List<DateTime> get weekDates => _weekDates;

  int get selectedDateIndex => _selectedDateIndex;

  String get weekLabel => 'Week 1/4';

  List<String> get dayLabels => _dayLabels;

  DateTime get selectedDate => _weekDates[_selectedDateIndex];

  bool get isSelectedToday {
    final now = DateTime.now();
    final d = selectedDate;
    return d.year == now.year && d.month == now.month && d.day == now.day;
  }

  String get selectedDateLabel {
    const months = [
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
    final d = selectedDate;
    final prefix = isSelectedToday ? 'Today' : _weekdayShort(d.weekday);
    return '$prefix, ${d.day} ${months[d.month - 1]} ${d.year}';
  }

  static String _weekdayShort(int weekday) {
    const names = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    return names[weekday - 1];
  }

  static List<DateTime> _buildCurrentWeekDates() {
    final now = DateTime.now();
    final monday = now.subtract(Duration(days: now.weekday - 1));
    return List.generate(7, (i) => monday.add(Duration(days: i)));
  }

  static List<DateTime> _buildWeekContaining(DateTime date) {
    final monday = date.subtract(Duration(days: date.weekday - 1));
    return List.generate(7, (i) => monday.add(Duration(days: i)));
  }

  void navigateToDate(DateTime date) {
    _weekDates = _buildWeekContaining(date);
    for (var i = 0; i < _weekDates.length; i++) {
      final d = _weekDates[i];
      if (d.year == date.year && d.month == date.month && d.day == date.day) {
        _selectedDateIndex = i;
        notify();
        return;
      }
    }
    _selectedDateIndex = 0;
    notify();
  }

  int _indexOfToday() {
    final now = DateTime.now();
    for (var i = 0; i < _weekDates.length; i++) {
      final d = _weekDates[i];
      if (d.year == now.year && d.month == now.month && d.day == now.day) {
        return i;
      }
    }
    return 0;
  }

  void setSelectedDateIndex(int index) {
    if (index == _selectedDateIndex) return;
    if (index < 0 || index >= _weekDates.length) return;
    _selectedDateIndex = index;
    notify();
  }
}
