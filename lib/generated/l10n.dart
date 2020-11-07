// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values

class S {
  S();
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Registration Form App`
  String get appName {
    return Intl.message(
      'Registration Form App',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `Personal Data`
  String get personalData {
    return Intl.message(
      'Personal Data',
      name: 'personalData',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `1 / 3`
  String get oneOfThree {
    return Intl.message(
      '1 / 3',
      name: 'oneOfThree',
      desc: '',
      args: [],
    );
  }

  /// `2 / 3`
  String get twoOfThree {
    return Intl.message(
      '2 / 3',
      name: 'twoOfThree',
      desc: '',
      args: [],
    );
  }

  /// `3 / 3`
  String get threeOfThree {
    return Intl.message(
      '3 / 3',
      name: 'threeOfThree',
      desc: '',
      args: [],
    );
  }

  /// `Enter your KTP number`
  String get ktpNumber {
    return Intl.message(
      'Enter your KTP number',
      name: 'ktpNumber',
      desc: '',
      args: [],
    );
  }

  /// `ID card number`
  String get IdCardNum {
    return Intl.message(
      'ID card number',
      name: 'IdCardNum',
      desc: '',
      args: [],
    );
  }

  /// `Enter the Full Name`
  String get enterFullName {
    return Intl.message(
      'Enter the Full Name',
      name: 'enterFullName',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get fullName {
    return Intl.message(
      'Full Name',
      name: 'fullName',
      desc: '',
      args: [],
    );
  }

  /// `Enter the Account Number`
  String get enterAccNum {
    return Intl.message(
      'Enter the Account Number',
      name: 'enterAccNum',
      desc: '',
      args: [],
    );
  }

  /// `Account Number`
  String get accounNum {
    return Intl.message(
      'Account Number',
      name: 'accounNum',
      desc: '',
      args: [],
    );
  }

  /// `Level of Education:`
  String get eduLevel {
    return Intl.message(
      'Level of Education:',
      name: 'eduLevel',
      desc: '',
      args: [],
    );
  }

  /// `Date of Birth:`
  String get chooseDOB {
    return Intl.message(
      'Date of Birth:',
      name: 'chooseDOB',
      desc: '',
      args: [],
    );
  }

  /// `ID card number must be filled`
  String get ktpRequiredError {
    return Intl.message(
      'ID card number must be filled',
      name: 'ktpRequiredError',
      desc: '',
      args: [],
    );
  }

  /// `KTP number at least 16 characters`
  String get ktpMinCharRequiredError {
    return Intl.message(
      'KTP number at least 16 characters',
      name: 'ktpMinCharRequiredError',
      desc: '',
      args: [],
    );
  }

  /// `KTP number should be 16 characters only`
  String get ktpMaxCharError {
    return Intl.message(
      'KTP number should be 16 characters only',
      name: 'ktpMaxCharError',
      desc: '',
      args: [],
    );
  }

  /// `The KTP number can only contain numbers`
  String get ktpNumericError {
    return Intl.message(
      'The KTP number can only contain numbers',
      name: 'ktpNumericError',
      desc: '',
      args: [],
    );
  }

  /// `Full name is required`
  String get nameRequiredError {
    return Intl.message(
      'Full name is required',
      name: 'nameRequiredError',
      desc: '',
      args: [],
    );
  }

  /// `Full name up to 10 characters`
  String get nameMaxCharError {
    return Intl.message(
      'Full name up to 10 characters',
      name: 'nameMaxCharError',
      desc: '',
      args: [],
    );
  }

  /// `Full names can only contain letters`
  String get nameIsNumericError {
    return Intl.message(
      'Full names can only contain letters',
      name: 'nameIsNumericError',
      desc: '',
      args: [],
    );
  }

  /// `Account Number is required`
  String get accNumRequiredError {
    return Intl.message(
      'Account Number is required',
      name: 'accNumRequiredError',
      desc: '',
      args: [],
    );
  }

  /// `Account Number of at least 8 characters`
  String get accountNumberMinCharRequiredError {
    return Intl.message(
      'Account Number of at least 8 characters',
      name: 'accountNumberMinCharRequiredError',
      desc: '',
      args: [],
    );
  }

  /// `Account Number may only contain numbers`
  String get accountNumNotNumericError {
    return Intl.message(
      'Account Number may only contain numbers',
      name: 'accountNumNotNumericError',
      desc: '',
      args: [],
    );
  }

  /// `Education level must be selected`
  String get eduNotSelectedError {
    return Intl.message(
      'Education level must be selected',
      name: 'eduNotSelectedError',
      desc: '',
      args: [],
    );
  }

  /// `Date of Birth is required`
  String get dobEmptyError {
    return Intl.message(
      'Date of Birth is required',
      name: 'dobEmptyError',
      desc: '',
      args: [],
    );
  }

  /// `Ktp Address Data`
  String get ktpAddressData {
    return Intl.message(
      'Ktp Address Data',
      name: 'ktpAddressData',
      desc: '',
      args: [],
    );
  }

  /// `KTP Address`
  String get ktpAddress {
    return Intl.message(
      'KTP Address',
      name: 'ktpAddress',
      desc: '',
      args: [],
    );
  }

  /// `Enter the KTP address`
  String get enterKtpAddress {
    return Intl.message(
      'Enter the KTP address',
      name: 'enterKtpAddress',
      desc: '',
      args: [],
    );
  }

  /// `Type of Residence:`
  String get typeOfResidence {
    return Intl.message(
      'Type of Residence:',
      name: 'typeOfResidence',
      desc: '',
      args: [],
    );
  }

  /// `Enter the Block Number`
  String get enterBlockNumber {
    return Intl.message(
      'Enter the Block Number',
      name: 'enterBlockNumber',
      desc: '',
      args: [],
    );
  }

  /// `Block Number`
  String get blockNumber {
    return Intl.message(
      'Block Number',
      name: 'blockNumber',
      desc: '',
      args: [],
    );
  }

  /// `Province:`
  String get province {
    return Intl.message(
      'Province:',
      name: 'province',
      desc: '',
      args: [],
    );
  }

  /// `Retry`
  String get retry {
    return Intl.message(
      'Retry',
      name: 'retry',
      desc: '',
      args: [],
    );
  }

  /// `Ktp address is required`
  String get ktpAddressRequiredError {
    return Intl.message(
      'Ktp address is required',
      name: 'ktpAddressRequiredError',
      desc: '',
      args: [],
    );
  }

  /// `Ktp address is up to 100 characters only`
  String get ktpAddressMaxCharError {
    return Intl.message(
      'Ktp address is up to 100 characters only',
      name: 'ktpAddressMaxCharError',
      desc: '',
      args: [],
    );
  }

  /// `Province is required`
  String get provinceRequiredError {
    return Intl.message(
      'Province is required',
      name: 'provinceRequiredError',
      desc: '',
      args: [],
    );
  }

  /// `Residence is required`
  String get residenceRequiredError {
    return Intl.message(
      'Residence is required',
      name: 'residenceRequiredError',
      desc: '',
      args: [],
    );
  }

  /// `Block is required`
  String get blockNumberRequiredError {
    return Intl.message(
      'Block is required',
      name: 'blockNumberRequiredError',
      desc: '',
      args: [],
    );
  }

  /// `Review Data`
  String get reviewData {
    return Intl.message(
      'Review Data',
      name: 'reviewData',
      desc: '',
      args: [],
    );
  }

  /// `Finish`
  String get finish {
    return Intl.message(
      'Finish',
      name: 'finish',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}