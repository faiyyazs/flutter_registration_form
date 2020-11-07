import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';
import 'package:registration_form/app/base/base_vm.dart';

class SplashVM extends BaseVM {
  PublishSubject<bool> _onBoardUserObservable = PublishSubject<bool>();

  PublishSubject<bool> get onBoardUser => _onBoardUserObservable;

  @override
  void initState() {
    super.initState();
    navigateToStep1();
  }

  void navigateToStep1() {
    addCompositeDisposable(
        Rx.timer(true, Duration(seconds: 3)).listen((status) {
      if (status) {
        _onBoardUserObservable.add(true);
      }
    }));
  }

  @override
  void dispose() {
    _onBoardUserObservable.close();
    super.dispose();
  }
}
