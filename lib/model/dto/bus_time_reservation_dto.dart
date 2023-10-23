import 'package:kumoh_school_bus/model/dto/response_dto.dart';
import 'package:kumoh_school_bus/model/dto/time_seat_reservation_dto.dart';
import 'bus_time_dto.dart';

class BusTimeReservationDTO implements ResponseDTO {
  BusTimeDTO busTimeDTO;
  List<TimeSeatReservationDTO> timeSeatReservationList;

  BusTimeReservationDTO({
    required this.busTimeDTO,
    required this.timeSeatReservationList,
  });

  @override
  BusTimeReservationDTO.fromJson(Map<String, dynamic> json)
      : busTimeDTO = BusTimeDTO.fromJson(json['busTimeDTO']),
        timeSeatReservationList = (json['timeSeatReservationList'] as List<dynamic>)
            .map((e) => TimeSeatReservationDTO.fromJson(e))
            .toList();
}
