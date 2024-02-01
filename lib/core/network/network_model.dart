
import 'package:equatable/equatable.dart';

class NetworkServerError extends Equatable{
   final bool success;
   final int  statusCode ;
   final String message ;

  const NetworkServerError(this.success, this.statusCode, this.message);
  
  @override
    List<Object?> get props => [success,statusCode,message];



} 