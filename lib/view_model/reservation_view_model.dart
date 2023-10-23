import 'package:flutter/material.dart';
import 'package:kumoh_school_bus/model/dto/dtos.dart';
import 'package:kumoh_school_bus/type/direction.dart';
import 'package:kumoh_school_bus/util/date_format.dart';
import 'package:kumoh_school_bus/view/common/basic_alter_dialog.dart';

import '../model/service/services.dart';

class ReservationViewModel extends ChangeNotifier {
  final MemberService _memberService = MemberService();
  final BusService _searchBusService = BusService();
  final ReservationService _reservationService = ReservationService();

  late SearchResponseDTO searchResponseDTO;
  late Direction direction;
  late StationDTO station;
  late DateTime reservationDate;

  late List<BusDTO> busList;
  late int busIndex;
  late BusDTO bus;

  late List<BusTimeSeatDTO> busTimeSeatList;

  late List<BusTimeDTO> busTimeList;
  late int busTimeIndex;
  late BusTimeDTO currentTime;

  late List<int> seatList;
  late int seatIndex;
  late int seat;

  ReservationViewModel() {
    searchResponseDTO = _searchBusService.searchResponseDTO!;
    direction = searchResponseDTO.direction;
    station = searchResponseDTO.station;
    reservationDate = searchResponseDTO.reservationDate;
    busList = searchResponseDTO.busList;
    _setBusIndex(0);
  }

  void _setSeatIndex(int index) {
    seatIndex = index;
    seat = seatList[index];
  }

  void _setBusTimeIndex(int index) {
    busTimeIndex = index;
    currentTime = busTimeList[busTimeIndex];
    seatList = busTimeSeatList[busTimeIndex]
        .timeSeatList
        .map((e) => e.seatNum)
        .toList();
    _setSeatIndex(0);
  }

  void _setBusIndex(int index) {
    busIndex = index;
    busTimeSeatList = busList[busIndex].busTimeSeatList;
    busTimeList = busTimeSeatList.map((e) => e.busTimeDTO).toList();
    bus = busList[busIndex];
    _setBusTimeIndex(0);
  }

  void onStartTimeChanged(dynamic value) {
    _setBusTimeIndex(busTimeList.indexOf(value));
    notifyListeners();
  }

  void onBusNumChanged(dynamic value) {
    _setBusIndex(busList.indexOf(value));
    notifyListeners();
  }

  void onSeatChanged(dynamic value) {
    _setSeatIndex(seatList.indexOf(value));
    notifyListeners();
  }

  Future onReservationButtonClicked(BuildContext context, bool mounted) async {
    try {
      await _reservationService.requestAddReservation(
          ReservationAddRequestDTO(
            station: station.sName,
            by: bus.busNum,
            when: onlyDateFormat.format(reservationDate),
            departure: busTimeList[busTimeIndex].startTime,
            seatNum: seatList[seatIndex],
          ),
          _memberService.memberInfoDTO!.id);
      if (mounted) Navigator.pushNamed(context, "/reservation/check");
    } catch (e) {
      BasicAlterDialog.showWarningDialog(context, "예약에 실패하였습니다.");
    }
  }

  @override
  void dispose() {
    _searchBusService.clearSearchResponseDTO();
    super.dispose();
  }
}
