import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';
import 'package:registration_form/app/base/base_vm.dart';
import 'package:registration_form/app/helpers/datetimehelper.dart';
import 'package:registration_form/app/helpers/regexhelper.dart';
import 'package:registration_form/data/model/personal.dart';
import 'package:registration_form/data/state/personaldata_state.dart';
import 'package:registration_form/generated/l10n.dart';

import 'constants/education.dart';

class PersonalDataVM extends BaseVM {
  final TextEditingController idEC = TextEditingController();
  final TextEditingController nameEC = TextEditingController();
  final TextEditingController accNumEC = TextEditingController();

  EducationLevel _selectedEducationLevel = EducationLevel.Select;

  EducationLevel get selectedEducationLevel => _selectedEducationLevel;

  set selectedEducationLevel(EducationLevel value) {
    _selectedEducationLevel = value;
    notifyListeners();
  }

  DateTime _selectedDate = DateTime.now();

  DateTime get selectedDate => _selectedDate;

  set selectedDate(DateTime value) {
    _selectedDate = value;
    notifyListeners();
  }

  final PublishSubject<PersonalDataState> _personalDataState =
      PublishSubject<PersonalDataState>();

  Stream<PersonalDataState> get personalDataState => _personalDataState.stream;

  bool submit(S localisation, String ktpId, String name, String accountNumber,
      EducationLevel educationLevel, DateTime dob) {
    if (ktpId.isEmpty) {
      _personalDataState.sink
          .add(PersonalDataState(message: localisation.ktpRequiredError));
      return false;
    }

    if (ktpId.trim().length < 16) {
      _personalDataState.sink.add(
          PersonalDataState(message: localisation.ktpMinCharRequiredError));
      return false;
    }
    if (ktpId.trim().length > 16) {
      _personalDataState
          .add(PersonalDataState(message: localisation.ktpMaxCharError));
      return false;
    }
    if (!RegexHelper.isNumeric(ktpId)) {
      _personalDataState
          .add(PersonalDataState(message: localisation.ktpNumericError));
      return false;
    }
    if (name.isEmpty) {
      _personalDataState
          .add(PersonalDataState(message: localisation.nameRequiredError));
      return false;
    }
    if (name.trim().length > 10) {
      _personalDataState
          .add(PersonalDataState(message: localisation.nameMaxCharError));

      return false;
    }

    if (RegexHelper.isNumeric(name)) {
      _personalDataState
          .add(PersonalDataState(message: localisation.nameIsNumericError));
      return false;
    }

    if (accountNumber.isEmpty) {
      _personalDataState
          .add(PersonalDataState(message: localisation.accNumRequiredError));
      return false;
    }
    if (accountNumber.trim().length < 8) {
      _personalDataState.add(PersonalDataState(
          message: localisation.accountNumberMinCharRequiredError));
      return false;
    }

    if (!RegexHelper.isNumeric(accountNumber)) {
      _personalDataState.add(
          PersonalDataState(message: localisation.accountNumNotNumericError));
      return false;
    }

    if (educationLevel == EducationLevel.Select) {
      _personalDataState
          .add(PersonalDataState(message: localisation.eduNotSelectedError));
      return false;
    }
    if (dob == null || dob.toString().isEmpty) {
      _personalDataState
          .add(PersonalDataState(message: localisation.dobEmptyError));
      return false;
    }
    _personalDataState.add(PersonalDataState(
        isSuccess: true,
        data: Personal(
            name: name,
            accountNumber: accountNumber,
            dob: DateTimeHelper.convertDateTimeToCustomFormatDate(dob),
            educationLevel: educationLevel.toShortString(),
            ktpId: ktpId)));
    return true;
  }
}
