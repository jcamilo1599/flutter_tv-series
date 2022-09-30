import 'dart:async';
import 'dart:io';

String apiError(Exception error) {
  String response = 'Se produjo un error indefinido ☠️';

  if (error is HttpException) {
    response = 'Se produjo un error... HttpException';
  } else if (error is FormatException) {
    response = 'Se produjo un error... FormatException';
  } else if (error is SocketException) {
    response = 'Se produjo un error... SocketException';
  } else if (error is TimeoutException) {
    response = 'Se produjo un error... TimeoutException';
  }

  return response;
}
