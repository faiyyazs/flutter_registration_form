import 'package:json_annotation/json_annotation.dart';
import 'package:registration_form/data/network/entity/province.dart';
import 'package:registration_form/domain/model/province.dart';
import 'package:registration_form/domain/utils/base_tranformer.dart';

part 'province_response.g.dart';

@JsonSerializable()
class ProvinceResponse
    extends BaseTransformer<ProvinceResponse, List<Province>> {
  @JsonKey(name: 'error', defaultValue: false, includeIfNull: false)
  bool error;

  @JsonKey(name: 'message', defaultValue: "", includeIfNull: false)
  String message;

  @JsonKey(name: 'provinsi')
  List<ProvinceEntity> provinces;

  ProvinceResponse({this.provinces, this.error: false, this.message: ""});

  factory ProvinceResponse.fromJson(Map<String, dynamic> json) =>
      _$ProvinceResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProvinceResponseToJson(this);

  @override
  ProvinceResponse restore(List<Province> data) {
    return ProvinceResponse(
        provinces: data.map((e) => ProvinceEntity()).toList());
  }

  @override
  List<Province> transform() {
    return this.provinces.map((e) => Province(id: e.id, name: e.name)).toList();
  }
}
