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
  E500('server-exception'),
  E403('access denied'),
  E401('bad creditinals suka blyat'),
  E400('invalid data'),
  incorrectNumber('incorrectNumber'),
  passwordMismatch('passwordMismatch');

  const HttpStatusAndErrors(this.value);

  @override
  final String value;

  @override
  String toString() => value;
}
