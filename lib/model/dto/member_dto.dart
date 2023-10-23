import 'package:kumoh_school_bus/model/dto/request_dto.dart';
import 'package:kumoh_school_bus/model/dto/response_dto.dart';
import 'package:kumoh_school_bus/type/types.dart';

class MemberDTO implements RequestDTO, ResponseDTO {
  String name;
  String id;
  Major major;

  MemberDTO({
    required this.name,
    required this.id,
    required this.major,
  });

  MemberDTO.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        id = json['loginId'],
        major = Major.fromString(json['major']);

  @override
  Map<String, dynamic> toJson() => {
    'name': name,
    'loginId': id,
    'major': major.toString(),
  };
}
