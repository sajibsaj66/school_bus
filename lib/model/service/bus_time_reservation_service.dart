import 'package:kumoh_school_bus/model/dto/bus_time_reservation_dto.dart';
import 'package:kumoh_school_bus/model/repository/repositories.dart';

class BusTimeSeatReservationService {
  final ReservationRepository _repository = ReservationRepository();

  BusTimeSeatReservationService._privateConstructor();

  static final BusTimeSeatReservationService _instance =
      BusTimeSeatReservationService._privateConstructor();

  factory BusTimeSeatReservationService() {
    return _instance;
  }

  late BusTimeReservationDTO _busTimeSeatReservationDTO;

  BusTimeReservationDTO get busTimeSeatReservationDTO =>
      _busTimeSeatReservationDTO;

  Future requestReservationListByBus(String busTimeId) async {
    _busTimeSeatReservationDTO =
        await _repository.requestReservationListByBus(busTimeId);
    _busTimeSeatReservationDTO.timeSeatReservationList
        .sort((a, b) => a.timeSeatDTO.seatNum.compareTo(b.timeSeatDTO.seatNum));
  }
}
