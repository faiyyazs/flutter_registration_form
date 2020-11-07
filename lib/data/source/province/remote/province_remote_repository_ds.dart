import 'package:registration_form/data/network/api_service.dart';
import 'package:registration_form/data/network/response/province_response.dart';

import '../province_repository_ds.dart';

class ProvinceRemoteRepositoryDataSource extends ProvinceRepoDataStoreRemote {
  final ApiService _apiService;

  ProvinceRemoteRepositoryDataSource(this._apiService);

  @override
  Future<ProvinceResponse> getProvinces() async {
    return _apiService.getProvince();
  }
}
