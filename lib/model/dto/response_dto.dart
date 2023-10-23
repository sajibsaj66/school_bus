import 'dto.dart';

abstract class ResponseDTO implements DTO {
  ResponseDTO.fromJson(Map<String,dynamic> json);
}