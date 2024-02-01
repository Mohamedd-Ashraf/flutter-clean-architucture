

import 'package:data_session/core/network/error_message_model.dart';

class ServerException implements Exception{
  final ErrorMessageModel errorMessageModel;

  ServerException({required this.errorMessageModel});
}