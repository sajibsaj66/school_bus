import 'package:kumoh_school_bus/model/dto/bus_time_reservation_dto.dart';
import 'package:kumoh_school_bus/model/dto/dtos.dart';
import 'package:kumoh_school_bus/model/dto/reservation_chart_dto.dart';
import 'package:kumoh_school_bus/model/repository/base_repository.dart';
import 'package:kumoh_school_bus/util/date_format.dart';

class ReservationRepository implements BaseRepository {
  @override
  String path = "/reservation";

  ReservationRepository._privateConstructor();

  static final ReservationRepository _instance =
      ReservationRepository._privateConstructor();

  factory ReservationRepository() {
    return _instance;
  }

  Future<BusTimeReservationDTO> requestReservationListByBus(
      String busTimeId) async {
    Map<String, dynamic> json =
        await BaseRepository.get("$path/bus/$busTimeId");
    return BusTimeReservationDTO.fromJson(json);
  }

  Future<List<ReservationDTO>> requestReservationListByMember(
      String memberId) async {
    Map<String, dynamic> json = await BaseRepository.get("$path/$memberId");
    return (json["data"] as List<dynamic>)
        .map((e) => ReservationDTO.fromJson(e))
        .toList();
  }

  Future<List<ReservationDTO>> requestAddReservation(
      ReservationAddRequestDTO requestDTO, String memberId) async {
    Map<String, dynamic> json =
        await BaseRepository.post("$path/$memberId", requestDTO.toJson());
    return (json["data"] as List<dynamic>)
        .map((e) => ReservationDTO.fromJson(e))
        .toList();
  }

  Future<List<ReservationDTO>> requestDeleteReservation(
      String reservationId, String memberId) async {
    Map<String, dynamic> json =
        await BaseRepository.delete("$path/$memberId/$reservationId");
    return (json["data"] as List<dynamic>)
        .map((e) => ReservationDTO.fromJson(e))
        .toList();
  }

  Future finish(String busTimeId) async {
    await BaseRepository.post("$path/finish/$busTimeId", {});
  }

  Future<List<ReservationChartDTO>> requestReservationChart() async {
    Map<String, dynamic> json = await BaseRepository.get("$path/chart");
    List<String> date = (json["data"] as List<dynamic>).map((e) => e["when"] as String).toList();
    List<ReservationChartDTO> reservationChartDTOList = [
      ReservationChartDTO(day: '일', count: 0),
      ReservationChartDTO(day: '월', count: 0),
      ReservationChartDTO(day: '화', count: 0),
      ReservationChartDTO(day: '수', count: 0),
      ReservationChartDTO(day: '목', count: 0),
      ReservationChartDTO(day: '금', count: 0),
      ReservationChartDTO(day: '토', count: 0),
    ];
    for (var element in date) {
      reservationChartDTOList[onlyDateFormat.parse(element).weekday].count++;
    }
    return reservationChartDTOList;
  }
}
