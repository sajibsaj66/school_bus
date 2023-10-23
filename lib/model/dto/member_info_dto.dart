import 'package:kumoh_school_bus/model/dto/request_dto.dart';
import 'package:kumoh_school_bus/model/dto/response_dto.dart';
import 'package:kumoh_school_bus/type/types.dart';

class MemberInfoDTO implements RequestDTO, ResponseDTO {
  String name;
  String id;
  String password;
  Major major;
  MemberType type;
  String? token;

  MemberInfoDTO({
    required this.name,
    required this.id,
    required this.password,
    required this.major,
    required this.type,
    this.token,
  });

  MemberInfoDTO.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        //json['name'],
        id = json['loginId'],
        password = json['password'],
        major = Major.fromString(json['major']),
        //json['major'],
        type = MemberType.fromString(json['type']),
        token = json['token'];

  @override
  Map<String, dynamic> toJson() => {
        'name': name,
        'loginId': id,
        'password': password,
        'major': major.toString(),
        'type': type.toString(),
      };
}
