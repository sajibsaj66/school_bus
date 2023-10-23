import 'package:kumoh_school_bus/model/dto/request_dto.dart';

class LoginDTO extends RequestDTO {
  String id;
  String password;

  LoginDTO({
    required this.id,
    required this.password,
  });

  @override
  Map<String, dynamic> toJson() => {
    'loginId' : id,
    'password' : password,
  };
}
