import 'package:flutter/foundation.dart';

/// Base class for all ViewModels in the app.
/// Use [ChangeNotifier] so UI can listen via [ChangeNotifierProvider] or [ListenableBuilder].
abstract class BaseViewModel extends ChangeNotifier {
  /// Call when data changes so listeners rebuild.
  @protected
  void notify() => notifyListeners();
}
