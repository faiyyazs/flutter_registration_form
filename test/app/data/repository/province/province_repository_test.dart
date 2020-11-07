import 'dart:async';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:registration_form/data/network/api_service.dart';
import 'package:registration_form/data/network/response/province_response.dart';
import 'package:registration_form/data/repository/province/province_repository.dart';
import 'package:registration_form/data/source/province/remote/province_remote_repository_ds.dart';
import 'package:registration_form/domain/model/province.dart';
import 'package:registration_form/domain/utils/resource.dart';

import '../../../mock/mock.dart';

void main() {
  ProvinceRemoteRepositoryDataSource remoteRepositoryDataSource;
  ApiService apiService;
  ProvinceRepositoryImpl provinceRepository;

  setUp(() {
    apiService = MockApiService();
    remoteRepositoryDataSource = MockProvinceRemoteRepositoryDataSource();
    provinceRepository = ProvinceRepositoryImpl(remoteRepositoryDataSource);
  });

  group('ProvinceRepositoryImpl Test', () {
    test('getProvinces_networkError_errorReturned', () async {
      // Setup
      when(apiService.getProvince()).thenAnswer((realInvocation) =>
          Future.value(throw HttpException("Network Error")));
      when(remoteRepositoryDataSource.getProvinces())
          .thenAnswer((realInvocation) => apiService.getProvince());

      //Action
      final result = await provinceRepository.getProvinceList();

      //Result
      Resource<List<Province>> expected =
          Resource.error<List<Province>>(code: StatusCode.NETWORK_ERROR);
      expect(result.code, expected.code);
    });

    test('getProvinces_generalError_errorReturned', () async {
      // Setup
      when(apiService.getProvince()).thenAnswer(
          (realInvocation) => Future.value(throw Exception("General Error")));
      when(remoteRepositoryDataSource.getProvinces())
          .thenAnswer((realInvocation) => apiService.getProvince());

      //Action
      final result = await provinceRepository.getProvinceList();

      //Result
      Resource<List<Province>> expected =
          Resource.error<List<Province>>(code: StatusCode.GENERAL_ERROR);
      expect(result.code, expected.code);
    });

    test('getProvinces_success_successReturned', () async {
      // Setup
      when(apiService.getProvince()).thenAnswer((realInvocation) =>
          Future.value(ProvinceResponse(
              provinces: [], error: false, message: "Success")));
      when(remoteRepositoryDataSource.getProvinces())
          .thenAnswer((realInvocation) => apiService.getProvince());

      //Action
      final result = await provinceRepository.getProvinceList();

      //Result
      Resource<List<Province>> expected = Resource.success<List<Province>>();
      expect(result.status, expected.status);
    });

    test('getProvinces_failed_errorReturned', () async {
      // Setup
      when(apiService.getProvince()).thenAnswer((realInvocation) =>
          Future.value(
              ProvinceResponse(provinces: [], error: true, message: "Error")));
      when(remoteRepositoryDataSource.getProvinces())
          .thenAnswer((realInvocation) => apiService.getProvince());

      //Action
      final result = await provinceRepository.getProvinceList();

      //Result
      Resource<List<Province>> expected = Resource.error<List<Province>>();
      expect(result.status, expected.status);
    });
  });
}
