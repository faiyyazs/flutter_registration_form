import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'response/province_response.dart';

part 'api_service.g.dart';

//flutter pub run build_runner build
@RestApi(baseUrl: "https://dev.farizdotid.com/api")
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) {
    dio.options = BaseOptions(receiveTimeout: 5000, connectTimeout: 5000);
    return _ApiService(dio, baseUrl: baseUrl);
  }

  @GET("/daerahindonesia/provinsi")
  Future<ProvinceResponse> getProvince();
}
