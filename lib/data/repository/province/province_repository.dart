import 'dart:io';

import 'package:registration_form/data/source/province/remote/province_remote_repository_ds.dart';
import 'package:registration_form/domain/model/province.dart';
import 'package:registration_form/domain/repository/province/province_respository.dart';
import 'package:registration_form/domain/utils/resource.dart';

class ProvinceRepositoryImpl extends ProvinceRepository {
  final ProvinceRemoteRepositoryDataSource _remoteRepositoryDataSource;

  ProvinceRepositoryImpl(this._remoteRepositoryDataSource);

  @override
  Future<Resource<List<Province>>> getProvinceList() async {
    try {
      final response = await _remoteRepositoryDataSource.getProvinces();
      print('Response ${response.toJson()}');
      switch (response.error) {
        case false:
          return Resource.success<List<Province>>(data: response.transform());

        case true:
        default:
          return Resource.error<List<Province>>(error: response.message);
      }
    } on Exception catch (e) {
      if (e is HttpException) {
        return Resource.error<List<Province>>(
            error: "Network Error", code: StatusCode.NETWORK_ERROR);
      } else {
        return Resource.error<List<Province>>(
            error: "General Error", code: StatusCode.GENERAL_ERROR);
      }
    }
  }
}
