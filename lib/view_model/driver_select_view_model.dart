import 'package:flutter/material.dart';
import 'package:kumoh_school_bus/model/dto/select_response_dto.dart';
import 'package:kumoh_school_bus/model/service/bus_service.dart';
import 'package:kumoh_school_bus/model/service/bus_time_reservation_service.dart';
import 'package:kumoh_school_bus/view/common/basic_alter_dialog.dart';

class DriverSelectViewModel extends ChangeNotifier {
  final BusTimeSeatReservationService _reservationService =
  BusTimeSeatReservationService();

  final BusService _busService = BusService();

  late List<SelectResponseDTO> selectResponseList;
  late SelectResponseDTO selectBusTime;
  late int selectResponseIndex;

  DriverSelectViewModel() {
    selectResponseList = _busService.selectResponseList!;
    selectResponseIndex = 0;
    selectBusTime = selectResponseList[selectResponseIndex];
  }

  void onBusSelect(int index) {
    selectResponseIndex = index;
    selectBusTime = selectResponseList[selectResponseIndex];
    notifyListeners();
  }

  Future onBusTimeSelect(BuildContext context, bool mounted, String busTimeId) async {
    try {
      await _reservationService.requestReservationListByBus(busTimeId);
      if (mounted) {
        Navigator.pushNamedAndRemoveUntil(context, "/driver", (route) => false);
      }
      _busService.busTimeId = busTimeId;
    } catch (e) {
      print(e);
      BasicAlterDialog.showWarningDialog(context, "해당하는 버스가 없습니다.");
    }
  }
}