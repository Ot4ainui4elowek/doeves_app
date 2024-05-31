abstract class HttpStatus {
  abstract final String value;

  static HttpStatusAndErrors fromString(String value) {
    return HttpStatusAndErrors.values
        .firstWhere((element) => element.value == value);
  }
}

enum HttpStatusAndErrors implements HttpStatus {
  invalidRequest('invalid-request'),
  handlerException('handler-exception'),
  unknownException('unknown-exception'),
  unableStatus('unhandled-status-code'),
  e500('server-exception'),
  e400('invalid data'),
  incorrectNumber('incorrectNumber'),
  passwordMismatch('passwordMismatch');

  const HttpStatusAndErrors(this.value);

  @override
  final String value;

  @override
  String toString() => value;
}
