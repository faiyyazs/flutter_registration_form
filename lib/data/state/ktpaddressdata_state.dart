import 'package:registration_form/data/model/ktpaddress.dart';
import 'package:registration_form/data/state/base_state.dart';

class KtpAddressDataState extends BaseState<KtpAddress> {
  KtpAddressDataState({message: "", isSuccess: false, KtpAddress data})
      : super(message: message, isSuccess: isSuccess, data: data);
}
