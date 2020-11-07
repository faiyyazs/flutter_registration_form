import 'package:registration_form/data/network/response/province_response.dart';

abstract class ProvinceRepoDataStoreRemote {
  Future<ProvinceResponse> getProvinces();
}

abstract class ProvinceLocalDataStoreRemote {}
