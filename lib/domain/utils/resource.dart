import 'status.dart';

class Resource<T> {
  final Status status;
  final T data;
  final String message;
  final int code;

  Resource({this.status, this.data, this.message, this.code});

  static Resource<T> success<T>({T data}) {
    return Resource<T>(status: Status.SUCCESS, data: data);
  }

  static Resource<T> error<T>({T data, String error, int code}) {
    return Resource<T>(status: Status.ERROR, code: code, message: error);
  }
}

class StatusCode {
  static const int NO_ERROR = 0;
  static const NETWORK_ERROR = 1;
  static const GENERAL_ERROR = 2;
}
