import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:registration_form/app/feature/addressdata/constants/residence.dart';
import 'package:registration_form/app/feature/addressdata/ktpaddressdata_vm.dart';
import 'package:registration_form/data/state/ktpaddressdata_state.dart';
import 'package:registration_form/domain/model/province.dart';
import 'package:registration_form/generated/l10n.dart';

import '../../mock/mock.dart';


void main() {
  MockApiService apiService;
  MockProvinceRemoteRepositoryDataSource remoteRepositoryDataSource;
  MockProvinceRepository provinceRepository;
  MockFetchProvincesUseCase fetchProvincesUseCase;
  MockProvinceListVM provinceListVM;
  KtpAddressDataVM _ktpAddressDataVM;
  S localisation;


  setUp(() {
    localisation = S();
    apiService = MockApiService();
    remoteRepositoryDataSource = MockProvinceRemoteRepositoryDataSource();
    provinceRepository = MockProvinceRepository();
    fetchProvincesUseCase = MockFetchProvincesUseCase();
    provinceListVM = MockProvinceListVM();
    _ktpAddressDataVM = KtpAddressDataVM(provinceListVM);
  });

  tearDown(() {
    _ktpAddressDataVM.dispose();
  });

  group('KtpAddressDataVM Test', () {
    test('submit_provinceNotSelected_failedReturned', () {
      // Setup
      KtpAddressDataState expected =
          KtpAddressDataState(message: localisation.provinceRequiredError);

      // Action
      scheduleMicrotask(() {
        _ktpAddressDataVM.submit(
            localisation, null, ResidenceType.Select, "", "");
      });

      //Result
      expectLater(
          _ktpAddressDataVM.ktpAddressState.map((event) => event.message),
          emits(expected.message));
    });

    test('submit_residenceTypeNotSelected_failedReturned', () {
      // Setup
      KtpAddressDataState expected =
          KtpAddressDataState(message: localisation.residenceRequiredError);

      // Action
      scheduleMicrotask(() {
        _ktpAddressDataVM.submit(
            localisation, Province(), ResidenceType.Select, "", "");
      });

      //Result
      expectLater(
          _ktpAddressDataVM.ktpAddressState.map((event) => event.message),
          emits(expected.message));
    });

    test('submit_residenceTypeNotSelected_failedReturned', () {
      // Setup
      KtpAddressDataState expected =
          KtpAddressDataState(message: localisation.residenceRequiredError);

      // Action
      scheduleMicrotask(() {
        _ktpAddressDataVM.submit(
            localisation, Province(), ResidenceType.Select, "", "");
      });

      //Result
      expectLater(
          _ktpAddressDataVM.ktpAddressState.map((event) => event.message),
          emits(expected.message));
    });

    test('submit_blockNumberEmpty_failedReturned', () {
      // Setup
      KtpAddressDataState expected =
          KtpAddressDataState(message: localisation.blockNumberRequiredError);

      // Action
      scheduleMicrotask(() {
        _ktpAddressDataVM.submit(
            localisation, Province(), ResidenceType.Rumah, "", "");
      });

      //Result
      expectLater(
          _ktpAddressDataVM.ktpAddressState.map((event) => event.message),
          emits(expected.message));
    });

    test('submit_addressEmpty_failedReturned', () {
      // Setup
      KtpAddressDataState expected =
          KtpAddressDataState(message: localisation.ktpAddressRequiredError);

      // Action
      scheduleMicrotask(() {
        _ktpAddressDataVM.submit(
            localisation, Province(), ResidenceType.Rumah, "124dd", "");
      });

      //Result
      expectLater(
          _ktpAddressDataVM.ktpAddressState.map((event) => event.message),
          emits(expected.message));
    });

    test('submit_KtpAddressGreaterThanOneHundred_failedReturned', () {
      // Setup
      KtpAddressDataState expected =
          KtpAddressDataState(message: localisation.ktpAddressMaxCharError);

      // Action
      scheduleMicrotask(() {
        _ktpAddressDataVM.submit(
            localisation,
            Province(),
            ResidenceType.Rumah,
            "124dd",
            "Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet"); //107 chars
      });

      //Result
      expectLater(
          _ktpAddressDataVM.ktpAddressState.map((event) => event.message),
          emits(expected.message));
    });

  });
}
