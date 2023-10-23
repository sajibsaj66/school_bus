import 'package:kumoh_school_bus/model/dto/response_dto.dart';
import 'bus_time_dto.dart';
import 'time_seat_dto.dart';

class BusTimeSeatDTO implements ResponseDTO {
  BusTimeDTO busTimeDTO;
  List<TimeSeatDTO> timeSeatList;

  BusTimeSeatDTO({
    required this.busTimeDTO,
    required this.timeSeatList,
  });

  @override
  BusTimeSeatDTO.fromJson(Map<String, dynamic> json)
      : busTimeDTO = BusTimeDTO.fromJson(json['busTimeDTO']),
        timeSeatList = (json['timeSeatList'] as List<dynamic>)
            .map((e) => TimeSeatDTO.fromJson(e))
            .toList();
}
