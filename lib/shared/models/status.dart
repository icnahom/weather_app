import 'package:flutter/foundation.dart';

enum Status {
  loading,
  success,
  failure;

  bool get isLoading => this == Status.loading;
  bool get isSuccess => this == Status.success;
  bool get isFailure => this == Status.failure;
}

mixin StatusProviderMixin on ChangeNotifier {
  Status get status => _status;
  Status _status = Status.loading;
  set status(Status value) {
    if (_status == value) return;
    _status = value;
    notifyListeners();
  }
}
