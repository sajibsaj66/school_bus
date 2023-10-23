import 'package:kumoh_school_bus/model/dto/response_dto.dart';

class TimeSeatDTO implements ResponseDTO {
  bool isReserved;
  int seatNum;

  TimeSeatDTO({
    required this.isReserved,
    required this.seatNum,
  });

  @override
  TimeSeatDTO.fromJson(Map<String, dynamic> json)
      : isReserved = json['reserved'],
        seatNum = json['seatNum'];
}
