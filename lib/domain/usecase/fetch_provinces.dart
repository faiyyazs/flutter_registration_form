import 'package:registration_form/domain/model/province.dart';
import 'package:registration_form/domain/repository/province/province_respository.dart';
import 'package:registration_form/domain/usecase/baseusecase.dart';
import 'package:registration_form/domain/utils/resource.dart';

class FetchProvincesUseCase extends BaseUseCase {
  final ProvinceRepository _provinceRepository;

  FetchProvincesUseCase(this._provinceRepository);

  @override
  Future<Resource<List<Province>>> execute({params}) {
    return _provinceRepository.getProvinceList();
  }
}
