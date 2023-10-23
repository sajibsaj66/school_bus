import 'package:kumoh_school_bus/model/dto/response_dto.dart';

import 'dtos.dart';

class BusDTO implements ResponseDTO {
  String busNum;
  List<BusTimeSeatDTO> busTimeSeatList;

  BusDTO({
    required this.busNum,
    required this.busTimeSeatList,
  });

  @override
  BusDTO.fromJson(Map<String, dynamic> json)
      : busNum = json['busNum'],
        busTimeSeatList =
            (json['busTimeSeatList'] as List<dynamic>)
                .map((e) => BusTimeSeatDTO.fromJson(e))
                .toList();

  @override
  String toString() => busNum;
}
