import 'package:mockito/mockito.dart';
import 'package:registration_form/app/feature/addressdata/provincelist_vm.dart';
import 'package:registration_form/data/network/api_service.dart';
import 'package:registration_form/data/source/province/remote/province_remote_repository_ds.dart';
import 'package:registration_form/domain/repository/province/province_respository.dart';
import 'package:registration_form/domain/usecase/fetch_provinces.dart';

class MockApiService extends Mock implements ApiService {}

class MockProvinceRemoteRepositoryDataSource extends Mock
    implements ProvinceRemoteRepositoryDataSource {}

class MockProvinceRepository extends Mock implements ProvinceRepository {}

class MockFetchProvincesUseCase extends Mock implements FetchProvincesUseCase {}

class MockProvinceListVM extends Mock implements ProvinceListVM {}
