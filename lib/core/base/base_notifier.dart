import 'package:untitle_isar/path_file.dart';
import 'package:flutter/material.dart';

class BaseNotifier extends ChangeNotifier with DBManager {
  bool disposed = false;

  BaseNotifier();

  ViewState _state = ViewState.Idle;

  ViewState get state => _state;

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
    disposed = true;
  }

  @override
  void notifyListeners() {
    if (!disposed) {
      super.notifyListeners();
    }
  }
}
