import 'package:dio/dio.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:registration_form/data/network/api_service.dart';
import 'package:registration_form/data/repository/province/province_repository.dart';
import 'package:registration_form/data/source/province/remote/province_remote_repository_ds.dart';
import 'package:registration_form/domain/repository/province/province_respository.dart';

List<SingleChildWidget> dataProviders = [
  ...independentServices,
  ...dependentServices,
];

List<SingleChildWidget> independentServices = [
  Provider.value(value: ApiService(Dio())),
];

List<SingleChildWidget> dependentServices = [
  ProxyProvider<ApiService, ProvinceRemoteRepositoryDataSource>(
    update: (context, ApiService source, target) =>
        ProvinceRemoteRepositoryDataSource(source),
  ),
  ProxyProvider<ProvinceRemoteRepositoryDataSource, ProvinceRepository>(
    update: (context, ProvinceRemoteRepositoryDataSource source, target) =>
        ProvinceRepositoryImpl(source),
  ),
];
