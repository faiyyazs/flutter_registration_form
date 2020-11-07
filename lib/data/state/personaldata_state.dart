import 'package:registration_form/data/model/personal.dart';
import 'package:registration_form/data/state/base_state.dart';

class PersonalDataState extends BaseState<Personal> {
  PersonalDataState({message: "", isSuccess: false, Personal data})
      : super(message: message, isSuccess: isSuccess, data: data);
}
