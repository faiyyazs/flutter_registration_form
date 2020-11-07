import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

class BaseVM extends ChangeNotifier {
  CompositeSubscription compositeDisposable = CompositeSubscription();
  bool _busy = false;

  bool get busy => _busy;

  BaseVM({busy = false}) {
    setBusy(busy);
    initState();
  }

  @mustCallSuper
  void initState() {}

  void setBusy(bool value) {
    _busy = value;
    notifyListeners();
  }

  void onCleared() {
    compositeDisposable.dispose();
  }

  void addCompositeDisposable(StreamSubscription subscription) {
    if (compositeDisposable.isDisposed) {
      compositeDisposable = CompositeSubscription();
    }
    compositeDisposable.add(subscription);
  }

  @mustCallSuper
  void dispose() {
    super.dispose();
    onCleared();
  }
}
