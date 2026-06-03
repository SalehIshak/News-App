import 'package:flutter/material.dart';

mixin SafeNotify on ChangeNotifier {
  bool isDispose = false;

  void notify() {
    if (!isDispose) notifyListeners();
  }

  /// FOR DISPOSE
  @override
  void dispose() {
    super.dispose();
    isDispose = true;
  }
}
