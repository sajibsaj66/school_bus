import 'package:kumoh_school_bus/model/dto/dtos.dart';
import 'package:kumoh_school_bus/model/dto/response_dto.dart';
import 'package:kumoh_school_bus/type/types.dart';
import 'package:kumoh_school_bus/util/utils.dart';

class SearchResponseDTO implements ResponseDTO {
  final List<BusDTO> busList;
  final Direction direction;
  final StationDTO station;
  final DateTime reservationDate;

  SearchResponseDTO({
    required this.busList,
    required this.direction,
    required this.station,
    required this.reservationDate,
  });

  @override
  SearchResponseDTO.fromJson(Map<String, dynamic> json)
      : busList = (json['busList'] as List<dynamic>)
            .map((e) => BusDTO.fromJson(e))
            .toList(),
        direction = Direction.fromString(json['direction']),
        station = StationDTO.fromJson(json['station']),
        reservationDate = onlyDateFormat.parse(json['reservationDate']);
}
