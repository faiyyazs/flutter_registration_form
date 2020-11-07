import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:registration_form/domain/repository/province/province_respository.dart';
import 'package:registration_form/domain/usecase/fetch_provinces.dart';

List<SingleChildWidget> domainProviders = [
  ...independentServices,
  ...dependentServices,
];

List<SingleChildWidget> independentServices = [];

List<SingleChildWidget> dependentServices = [
  ProxyProvider<ProvinceRepository, FetchProvincesUseCase>(
    update: (context, source, target) => FetchProvincesUseCase(source),
  )
];
