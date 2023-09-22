

class AppExceptions implements Exception {

  final _message ;
  final _prefix ;

  AppExceptions([this._message , this._prefix]) ;

  @override
  String toString(){
    return '$_prefix$_message';
  }

}


class InternetException extends AppExceptions {
  InternetException([String? message]) : super(message, 'No internet') ;
}


class RequestTimeOut extends AppExceptions {

  RequestTimeOut([String? message]) : super(message, 'Request Time out') ;

}

class ServerException extends AppExceptions {

  ServerException([String? message]) : super(message, 'Internal server error') ;

}

class InvalidUrlException extends AppExceptions {

  InvalidUrlException([String? message]) : super(message, 'Invalid Url') ;

}

class FetchDataException extends AppExceptions {
  FetchDataException([String? message]) : super(message, '') ;
}


class BadRequestException extends AppExceptions {
  BadRequestException([String? message]) : super(message, 'Bad Request ');
}

class UnauthorisedException extends AppExceptions {
  UnauthorisedException([String? message])
      : super(message, 'Unauthorised ');
}

class ForbiddenException extends AppExceptions {
  ForbiddenException([String? message]) : super(message, 'Forbidden ');
}

class NotFoundException extends AppExceptions {
  NotFoundException([String? message]) : super(message, 'Not Found ');
}

class InternalServerException extends AppExceptions {
  InternalServerException([String? message])
      : super(message, 'Internal Server Error ');
}

class FoundException extends AppExceptions {
  FoundException([String? message]) : super(message, 'Found ');
}

class ServiceUnavailableException extends AppExceptions {
  ServiceUnavailableException([String? message])
      : super(message, 'Service Unavailable ');
}


class AcceptedException extends AppExceptions {
  AcceptedException([String? message]) : super(message, 'Accepted ');
}

class NoContentException extends AppExceptions {
  NoContentException([String? message]) : super(message, 'No Content ');
}

class PartialContentException extends AppExceptions {
  PartialContentException([String? message])
      : super(message, 'Partial Content ');
}

class NotAcceptableException extends AppExceptions {
  NotAcceptableException([String? message])
      : super(message, 'Not Acceptable ');
}

class RequestTimeoutException extends AppExceptions {
  RequestTimeoutException([String? message])
      : super(message, 'Request Timeout ');
}

class RequestedRangeNotSatisfiableException extends AppExceptions {
  RequestedRangeNotSatisfiableException([String? message])
      : super(message, 'Requested Range Not Satisfiable ');
}
