import 'package:registration_form/domain/model/province.dart';
import 'package:registration_form/domain/utils/resource.dart';

abstract class ProvinceRepository {
  Future<Resource<List<Province>>> getProvinceList();
}
