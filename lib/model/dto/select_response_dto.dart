import 'package:kumoh_school_bus/model/dto/response_dto.dart';

import 'select_bus_time_dto.dart';

class SelectResponseDTO implements ResponseDTO {
  final String busNum;
  List<SelectBusTimeDTO> selectBusTimeList;

  @override
  SelectResponseDTO.fromJson(Map<String, dynamic> json)
      : busNum = json['busNum'],
        selectBusTimeList = (json['selectBusTimeList'] as List<dynamic>)
            .map((e) => SelectBusTimeDTO.fromJson(e))
            .toList();
}
