/// Navigation tab indices and route-related constants.
/// Centralizing these makes it easy to add/remove/reorder tabs.
abstract class NavRoutes {
  NavRoutes._();

  static const int nutrition = 0;
  static const int plan = 1;
  static const int mood = 2;
  static const int profile = 3;

  static const int tabCount = 4;
}
