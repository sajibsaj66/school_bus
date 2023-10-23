import 'package:kumoh_school_bus/model/dto/request_dto.dart';

class ReservationAddRequestDTO implements RequestDTO {
  final String station;
  final String by;
  final String when;
  final String departure;
  final int seatNum;

  ReservationAddRequestDTO({
    required this.station,
    required this.by,
    required this.when,
    required this.departure,
    required this.seatNum,
  });

  @override
  Map<String, dynamic> toJson() => {
        'station': station,
        'by': by,
        'when': when,
        'departure': departure,
        'seatNum': seatNum,
      };
}
