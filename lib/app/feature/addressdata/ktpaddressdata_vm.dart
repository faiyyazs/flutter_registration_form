import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';
import 'package:registration_form/app/base/base_vm.dart';
import 'package:registration_form/app/feature/addressdata/constants/residence.dart';
import 'package:registration_form/data/model/ktpaddress.dart';
import 'package:registration_form/data/state/ktpaddressdata_state.dart';
import 'package:registration_form/domain/model/province.dart';
import 'package:registration_form/generated/l10n.dart';

import 'provincelist_vm.dart';

class KtpAddressDataVM extends BaseVM {
  final ProvinceListVM proviceListVM;
  final TextEditingController ecDescription = TextEditingController();
  final TextEditingController ecBlockNumber = TextEditingController();
  ResidenceType _selectedResidence = ResidenceType.Select;
  final PublishSubject<KtpAddressDataState> _ktpAddressState =
      PublishSubject<KtpAddressDataState>();

  PublishSubject<KtpAddressDataState> get ktpAddressState =>
      _ktpAddressState.stream;

  KtpAddressDataVM(this.proviceListVM);

  ResidenceType get selectedResidence => _selectedResidence;

  set selectedResidence(ResidenceType value) {
    _selectedResidence = value;
    notifyListeners();
  }

  bool submit(
    S localisation,
    Province province,
    ResidenceType residence,
    String blockNumber,
    String address,
  ) {
    if (province == null) {
      ktpAddressState.add(
          KtpAddressDataState(message: localisation.provinceRequiredError));
      return false;
    }

    if (residence == ResidenceType.Select) {
      ktpAddressState.add(
          KtpAddressDataState(message: localisation.residenceRequiredError));
      return false;
    }

    if (blockNumber.isEmpty) {
      ktpAddressState.add(
          KtpAddressDataState(message: localisation.blockNumberRequiredError));
      return false;
    }

    if (address.isEmpty) {
      ktpAddressState.add(
          KtpAddressDataState(message: localisation.ktpAddressRequiredError));
      return false;
    }

    if (address.trim().length > 100) {
      ktpAddressState.add(
          KtpAddressDataState(message: localisation.ktpAddressMaxCharError));
      return false;
    }

    _ktpAddressState.add(KtpAddressDataState(
        isSuccess: true,
        data: KtpAddress(
            provinse: province.name,
            residence: residence.toShortString(),
            blockNumber: blockNumber,
            fullAddress: address)));
    return true;
  }
}
