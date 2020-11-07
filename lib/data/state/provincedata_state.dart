import 'package:registration_form/data/state/base_state.dart';
import 'package:registration_form/domain/model/province.dart';

class ProvinceDataState extends BaseState<List<Province>> {
  ProvinceDataState({message: "", isSuccess: false, List<Province> data})
      : super(message: message, isSuccess: isSuccess, data: data);
}
