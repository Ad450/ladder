class ParsedNetworkResponse<T> {
  ApiErrors? code;
  String? message;
  T? data;
  List dataList;

  ParsedNetworkResponse({this.code, this.message, this.data, this.dataList = const []}) {
    assert(
      (code == null || data == null) || (message == null || data == null),
      'You cannot use [data] along with [code] and/or [message]',
    );
  }
}

enum ApiErrors {
  serverError,
  badRequest,
  notFound,
  validationFailed,
  unauthenticated,
  notPermitted,
  unknown,
  noInternet,
  failure,
  noResponse,
}
