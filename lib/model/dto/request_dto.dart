import 'dto.dart';

abstract class RequestDTO implements DTO{
  Map<String, dynamic> toJson();
}