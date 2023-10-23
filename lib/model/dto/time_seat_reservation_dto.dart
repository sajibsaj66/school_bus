import 'package:kumoh_school_bus/model/dto/response_dto.dart';

import 'member_dto.dart';
import 'time_seat_dto.dart';

class TimeSeatReservationDTO implements ResponseDTO {
  TimeSeatDTO timeSeatDTO;
  MemberDTO? memberDTO;

  TimeSeatReservationDTO({
    required this.timeSeatDTO,
    required this.memberDTO,
  });

  @override
  TimeSeatReservationDTO.fromJson(Map<String, dynamic> json)
      : timeSeatDTO = TimeSeatDTO.fromJson(json['timeSeatDTO']),
        memberDTO = json['memberDTO'] == null
            ? null
            : MemberDTO.fromJson(json['memberDTO']);
}
