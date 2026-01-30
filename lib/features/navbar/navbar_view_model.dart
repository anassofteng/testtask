

import 'package:testapp/core/base/base_view_model.dart';
import 'package:testapp/core/constants/nav_routes.dart';

class NavBarViewModel extends BaseViewModel {
  NavBarViewModel() : _currentIndex = NavRoutes.nutrition;

  int _currentIndex;

  int get currentIndex => _currentIndex;

  void setIndex(int index) {
    if (index == _currentIndex) return;
    if (index < 0 || index >= NavRoutes.tabCount) return;
    _currentIndex = index;
    notify();
  }
}
