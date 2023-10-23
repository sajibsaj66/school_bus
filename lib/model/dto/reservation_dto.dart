import 'package:kumoh_school_bus/model/dto/response_dto.dart';
import 'package:kumoh_school_bus/type/types.dart';

class ReservationDTO implements ResponseDTO {
  final String id;
  final Direction type;
  final String station;
  final String by;
  final String when;
  final String taken;
  final int seatNum;
  final String at;

  ReservationDTO({
    required this.id,
    required this.type,
    required this.station,
    required this.by,
    required this.when,
    required this.seatNum,
    required this.taken,
    required this.at,
  });

  @override
  ReservationDTO.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        type = Direction.fromString(json['type']),
        station = json['station'],
        by = json['by'],
        when = json['when'],
        seatNum = json['seatNum'],
        taken = json['taken'],
        at = json['at'];
}
