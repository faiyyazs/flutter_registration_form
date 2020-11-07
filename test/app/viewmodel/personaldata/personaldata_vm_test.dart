import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:registration_form/app/feature/personaldata/constants/education.dart';
import 'package:registration_form/app/feature/personaldata/personaldata_vm.dart';
import 'package:registration_form/app/helpers/datetimehelper.dart';
import 'package:registration_form/data/model/personal.dart';
import 'package:registration_form/data/state/personaldata_state.dart';
import 'package:registration_form/generated/l10n.dart';

void main() {
  PersonalDataVM _personalDataVM;
  S localisation;

  setUp(() {
    localisation = S();
    _personalDataVM = PersonalDataVM();
  });

  tearDown(() {
    _personalDataVM.dispose();
  });

  group('PersonalDataVM Test', () {
    test('submit_idKtpEmpty_failedReturned', () {
      // Setup
      PersonalDataState expected =
          PersonalDataState(message: localisation.ktpRequiredError);

      // Action
      scheduleMicrotask(() {
        _personalDataVM.submit(
            localisation, "", "", "", EducationLevel.Select, DateTime.now());
      });

      //Result
      expectLater(
          _personalDataVM.personalDataState.map((event) => event.message),
          emits(expected.message));
    });

    test('submit_IdKtpInvalid_failedReturned', () {
      // Setup
      PersonalDataState expected =
          PersonalDataState(message: localisation.ktpMinCharRequiredError);

      // Action
      scheduleMicrotask(() {
        _personalDataVM.submit(localisation, "98765", "", "",
            EducationLevel.Select, DateTime.now());
      });

      //Result
      expectLater(
          _personalDataVM.personalDataState.map((event) => event.message),
          emits(expected.message));
    });

    test('submit_IdKtpGreaterThanSixteen_failedReturned', () {
      // Setup
      PersonalDataState expected =
          PersonalDataState(message: localisation.ktpMaxCharError);

      // Action
      scheduleMicrotask(() {
        _personalDataVM.submit(localisation, "98765432103123452", "", "",
            EducationLevel.Select, DateTime.now());
      });

      //Result
      expectLater(
          _personalDataVM.personalDataState.map((event) => event.message),
          emits(expected.message));
    });

    test('submit_fullNameEmpty_failedReturned', () {
      // Setup
      PersonalDataState expected =
          PersonalDataState(message: localisation.nameRequiredError);

      // Action
      scheduleMicrotask(() {
        _personalDataVM.submit(localisation, "9876543210312345", "", "",
            EducationLevel.Select, DateTime.now());
      });

      //Result
      expectLater(
          _personalDataVM.personalDataState.map((event) => event.message),
          emits(expected.message));
    });

    test('submit_fullNameGreaterThanTen_failedReturned', () {
      // Setup
      PersonalDataState expected =
          PersonalDataState(message: localisation.nameMaxCharError);

      // Action
      scheduleMicrotask(() {
        _personalDataVM.submit(localisation, "9876543210312345",
            "Faiyyaz Shaikh", "", EducationLevel.Select, DateTime.now());
      });

      //Result
      expectLater(
          _personalDataVM.personalDataState.map((event) => event.message),
          emits(expected.message));
    });

    test('submit_accountNumberLessThanEight_failedReturned', () {
      // Setup
      PersonalDataState expected = PersonalDataState(
          message: localisation.accountNumberMinCharRequiredError);

      // Action
      scheduleMicrotask(() {
        _personalDataVM.submit(localisation, "9876543210312345", "Faiyyaz",
            "12345", EducationLevel.Select, DateTime.now());
      });

      //Result
      expectLater(
          _personalDataVM.personalDataState.map((event) => event.message),
          emits(expected.message));
    });

    test('submit_accountNumberInvalid_failedReturned', () {
      // Setup
      PersonalDataState expected =
          PersonalDataState(message: localisation.accountNumNotNumericError);

      // Action
      scheduleMicrotask(() {
        _personalDataVM.submit(localisation, "9876543210312345", "Faiyyaz",
            "12345rg!", EducationLevel.Select, DateTime.now());
      });

      //Result
      expectLater(
          _personalDataVM.personalDataState.map((event) => event.message),
          emits(expected.message));
    });

    test('submit_educationLevelNotSelected_failedReturned', () {
      // Setup
      PersonalDataState expected =
          PersonalDataState(message: localisation.eduNotSelectedError);

      // Action
      scheduleMicrotask(() {
        _personalDataVM.submit(localisation, "9876543210312345", "Faiyyaz",
            "12345678", EducationLevel.Select, DateTime.now());
      });

      //Result
      expectLater(
          _personalDataVM.personalDataState.map((event) => event.message),
          emits(expected.message));
    });

    test('submit_dobEmpty_failedReturned', () {
      // Setup
      PersonalDataState expected =
          PersonalDataState(message: localisation.dobEmptyError);

      // Action
      scheduleMicrotask(() {
        _personalDataVM.submit(localisation, "9876543210312345", "Faiyyaz",
            "12345678", EducationLevel.S2, null);
      });

      //Result
      expectLater(
          _personalDataVM.personalDataState.map((event) => event.message),
          emits(expected.message));
    });

    test('submit_inputValidated_successReturned', () {
      // Setup
      _personalDataVM = PersonalDataVM();
      String idKtp = "9876543210312345";
      String fullName = "Faiyyaz";
      String accountNumber = "12345678";
      EducationLevel eduLevel = EducationLevel.S2;
      DateTime dob = DateTime.now();
      PersonalDataState expected = PersonalDataState(
          isSuccess: true,
          data: Personal(
              ktpId: idKtp,
              name: fullName,
              accountNumber: accountNumber,
              educationLevel: eduLevel.toShortString(),
              dob: DateTimeHelper.convertDateTimeToCustomFormatDate(dob)));

      // Action
      scheduleMicrotask(() {
        _personalDataVM.submit(
            localisation, idKtp, fullName, accountNumber, eduLevel, dob);
      });

      //Result
      expectLater(
          _personalDataVM.personalDataState.map((event) => event.data.ktpId),
          emits(expected.data.ktpId));
    });
  });
}
