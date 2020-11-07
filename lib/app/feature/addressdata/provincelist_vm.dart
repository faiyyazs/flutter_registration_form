import 'package:registration_form/app/base/base_vm.dart';
import 'package:registration_form/domain/model/province.dart';
import 'package:registration_form/domain/usecase/fetch_provinces.dart';

class ProvinceListVM extends BaseVM {
  final FetchProvincesUseCase _fetchProvincesUseCase;
  Province _selectedProvince;
  List<Province> _provinces = List();
  bool _error = false;

  bool get error => _error;

  ProvinceListVM(this._fetchProvincesUseCase, {busy: true}) : super(busy: busy);

  List<Province> get provinces => _provinces;

  set provinces(List<Province> value) {
    _provinces.addAll(value);
    notifyListeners();
  }

  Province get selectedProvince => _selectedProvince;

  set selectedProvince(Province value) {
    _selectedProvince = value;
    notifyListeners();
  }

  getProvices() {
    setBusy(true);
    _fetchProvincesUseCase.execute().then((event) {
      print("event data ${event.data.map((e) => e.toString())}");
      _error = false;
      event.data != null ? provinces = event.data : List();
      if (provinces.isNotEmpty && selectedProvince == null) {
        _selectedProvince = provinces?.first;
      }
      setBusy(false);
    }).catchError((e) {
      _error = true;
      setBusy(false);
    });
  }
}
