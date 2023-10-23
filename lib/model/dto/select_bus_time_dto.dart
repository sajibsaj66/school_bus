import 'package:kumoh_school_bus/model/dto/response_dto.dart';

class SelectBusTimeDTO implements ResponseDTO {
  final String id;
  final int busTimeNum;
  final String startTime;

  SelectBusTimeDTO.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        busTimeNum = json['busTimeNum'],
        startTime = json['startTime'];
}
